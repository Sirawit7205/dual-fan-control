#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
#include "display.h"
#include "millis.h"
#include "user_interface.h"

//private functions
void led_left_set_on();
void led_left_set_off();
void led_right_set_on();
void led_right_set_off();
void led_center_set_on();
void led_center_set_off();
void fan_left_set_on();
void fan_left_set_off();
void fan_right_set_on();
void fan_right_set_off();
void set_disp_center(volatile ui_display_context_t *context);
void set_disp_rpm_left(volatile ui_display_context_t *context);
void set_disp_rpm_right(volatile ui_display_context_t *context);
void set_disp_on(volatile ui_display_context_t *context);
void set_disp_off(volatile ui_display_context_t *context);
uint8_t get_animation_char(volatile ui_display_context_t *context, btn_state_enum side);

static const uint8_t anim_steps[ANIMATION_STEPS] = {0x09, 0x12, 0x24};
static volatile ui_display_context_t display_context;

void ui_init() {
    display_context.button_state = BTN_CENTER;
    display_context.display_state = DISP_CENTER;
    display_context.display_millis = 0;
    display_context.state_changed = true;
    display_context.left_side.animation_step = 0;
    display_context.left_side.fan_rpm = 0;
    display_context.left_side.fan_on = false;
    display_context.right_side.animation_step = 0;
    display_context.right_side.fan_rpm = 0;
    display_context.right_side.fan_on = false;
    led_center_set_on();
    led_left_set_off();
    led_right_set_off();
}

void ui_update_sel_btn() {
    if(display_context.button_state == BTN_CENTER) {
        display_context.button_state = BTN_LEFT;
        display_context.display_state = DISP_RPM_LEFT;
        led_left_set_on();
        led_right_set_off();
        led_center_set_off();
    } else if(display_context.button_state == BTN_LEFT) {
        display_context.button_state = BTN_RIGHT;
        display_context.display_state = DISP_RPM_RIGHT;
        led_right_set_on();
        led_left_set_off();
        led_center_set_off();
    } else {    //BTN_RIGHT
        display_context.button_state = BTN_CENTER;
        display_context.display_state = DISP_CENTER;
        led_center_set_on();
        led_left_set_off();
        led_right_set_off();
    }
    display_context.state_changed = true;
}

void ui_update_pwr_btn() {
    if(display_context.button_state == BTN_CENTER) {
        if(display_context.left_side.fan_on || display_context.right_side.fan_on) {
            display_context.left_side.fan_on = false;
            display_context.right_side.fan_on = false;
            display_context.display_state = DISP_OFF;
            fan_left_set_off();
            fan_right_set_off();
        } else {
            display_context.left_side.fan_on = true;
            display_context.right_side.fan_on = true;
            display_context.display_state = DISP_ON;
            fan_left_set_on();
            fan_right_set_on();
        }
    } else if(display_context.button_state == BTN_LEFT) {
        if(display_context.left_side.fan_on) {
            display_context.left_side.fan_on = false;
            display_context.display_state = DISP_OFF;
            fan_left_set_off();
        } else {
            display_context.left_side.fan_on = true;
            display_context.display_state = DISP_ON;
            fan_left_set_on();
        }
    } else {    //BTN_RIGHT
        if(display_context.right_side.fan_on) {
            display_context.right_side.fan_on = false;
            display_context.display_state = DISP_OFF;
            fan_right_set_off();
        } else {
            display_context.right_side.fan_on = true;
            display_context.display_state = DISP_ON;
            fan_right_set_on();
        }
    }
    display_context.state_changed = true;
}

void ui_update_data(bool fan1_on, uint32_t fan1_rpm, bool fan2_on, uint32_t fan2_rpm) {
    display_context.left_side.fan_on = fan1_on;
    display_context.left_side.fan_rpm = fan1_rpm;
    display_context.right_side.fan_on = fan2_on;
    display_context.right_side.fan_rpm = fan2_rpm;
}

void ui_update_state() {
    if(display_context.display_state == DISP_CENTER) {
        set_disp_center(&display_context);
    } else if(display_context.display_state == DISP_RPM_LEFT) {
        set_disp_rpm_left(&display_context);
    } else if(display_context.display_state == DISP_RPM_RIGHT) {
        set_disp_rpm_right(&display_context);
    } else if(display_context.display_state == DISP_PWM) {
        //TODO
    } else if(display_context.display_state == DISP_ON) {
        set_disp_on(&display_context);
    } else {    //DISP_OFF
        set_disp_off(&display_context);
    }
}

btn_state_enum ui_get_button_state() {
    return display_context.button_state;
}

//wrapper functions for status LEDs
void led_left_set_on() {
    LED_FAN1_SetLow();
}

void led_left_set_off() {
    LED_FAN1_SetHigh();
}

void led_right_set_on() {
    LED_FAN2_SetLow();
}

void led_right_set_off() {
    LED_FAN2_SetHigh();
}

void led_center_set_on() {
    LED_BOTH_SetLow();
}

void led_center_set_off() {
    LED_BOTH_SetHigh();
}

//wrapper functions for fan power controls
void fan_left_set_on() {
    ON1_SetHigh();
}

void fan_left_set_off() {
    ON1_SetLow();
}

void fan_right_set_on() {
    ON2_SetHigh();
}

void fan_right_set_off() {
    ON2_SetLow();
}

//private functions
void set_disp_center(volatile ui_display_context_t *context) {
    if(context->state_changed) {
        context->state_changed = false;
        context->display_millis = millis();
    }
    
    if(is_timed_out(context->display_millis, ANIMATION_PERIOD)) {
        context->display_millis = millis();
        uint8_t buffer[DISPLAY_DIGITS];
        buffer[0] = (context->left_side.fan_on) ? get_animation_char(context, BTN_LEFT) : CHAR_dash;
        buffer[1] = CHAR_clr;
        buffer[2] = CHAR_clr;
        buffer[3] = (context->right_side.fan_on) ? get_animation_char(context, BTN_RIGHT) : CHAR_dash;

        for(int i = 0; i < DISPLAY_DIGITS; i++) {
            tm1650_send_character(i, buffer[i]);
        }
    }
}

void set_disp_rpm_left(volatile ui_display_context_t *context) {
    if(context->state_changed) {
        context->state_changed = false;
        context->display_millis = millis();
        tm1650_set_number(context->left_side.fan_rpm, true);    //speed up display change
    }
    
    if(is_timed_out(context->display_millis, RPM_PERIOD)) {
        context->display_millis = millis();
        tm1650_set_number(context->left_side.fan_rpm, true);
    }
}

void set_disp_rpm_right(volatile ui_display_context_t *context) {
    if(context->state_changed) {
        context->state_changed = false;
        context->display_millis = millis();
        tm1650_set_number(context->right_side.fan_rpm, true);   //speed up display change
    }
    
    if(is_timed_out(context->display_millis, RPM_PERIOD)) {
        context->display_millis = millis();
        tm1650_set_number(context->right_side.fan_rpm, true);
    }
}

void set_disp_on(volatile ui_display_context_t *context) {
    if(context->state_changed) {
        context->state_changed = false;
        context->display_millis = millis();
        uint8_t buffer[DISPLAY_DIGITS];
        buffer[0] = CHAR_O;
        buffer[1] = CHAR_n;
        buffer[2] = CHAR_clr;
        buffer[3] = CHAR_clr;

        for(int i = 0; i < DISPLAY_DIGITS; i++) {
            tm1650_send_character(i, buffer[i]);
        }
    }
    
    if(is_timed_out(context->display_millis, ON_OFF_PERIOD)) {
        if(display_context.button_state == BTN_CENTER) {
            display_context.display_state = DISP_CENTER;
        } else if(display_context.button_state == BTN_LEFT) {
            display_context.display_state = DISP_RPM_LEFT;
        } else {    //BTN_RIGHT
            display_context.display_state = DISP_RPM_RIGHT;
        }
        display_context.state_changed = true;
    }
}

void set_disp_off(volatile ui_display_context_t *context) {
    if(context->state_changed) {
        context->state_changed = false;
        context->display_millis = millis();
        uint8_t buffer[DISPLAY_DIGITS];
        buffer[0] = CHAR_O;
        buffer[1] = CHAR_F;
        buffer[2] = CHAR_F;
        buffer[3] = CHAR_clr;

        for(int i = 0; i < DISPLAY_DIGITS; i++) {
            tm1650_send_character(i, buffer[i]);
        }
    }
    
    if(is_timed_out(context->display_millis, ON_OFF_PERIOD)) {
        if(display_context.button_state == BTN_CENTER) {
            display_context.display_state = DISP_CENTER;
        } else if(display_context.button_state == BTN_LEFT) {
            display_context.display_state = DISP_RPM_LEFT;
        } else {    //BTN_RIGHT
            display_context.display_state = DISP_RPM_RIGHT;
        }
        display_context.state_changed = true;
    }
}

uint8_t get_animation_char(volatile ui_display_context_t *context, btn_state_enum side) {
    if(side == BTN_LEFT) {
        uint8_t selected_anim = anim_steps[context->left_side.animation_step];
        context->left_side.animation_step++;
            if(context->left_side.animation_step >= ANIMATION_STEPS) {
                context->left_side.animation_step = 0;
            }
        return selected_anim;
    } else if(side == BTN_RIGHT) {
        uint8_t selected_anim = anim_steps[context->right_side.animation_step];
        context->right_side.animation_step++;
            if(context->right_side.animation_step >= ANIMATION_STEPS) {
                context->right_side.animation_step = 0;
            }
        return selected_anim;
    } else {    //BTN_CENTER
        return CHAR_clr;
    }
}
