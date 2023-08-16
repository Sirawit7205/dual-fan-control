#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
#include "speed_controller.h"

uint16_t pwm_get_max_range() {
    return PWM_TIMER_PER;
}

void fan1_power(bool on) {
    if(on) {
        PWM_TIMER_CTRLB |= FAN1_CMPEN_bm;
        ON1_SetHigh();
    } else {
        PWM_TIMER_CTRLB &= ~FAN1_CMPEN_bm;
        ON1_SetLow();
    }
}

void fan2_power(bool on) {
    if(on) {
        PWM_TIMER_CTRLB |= FAN2_CMPEN_bm;
        ON2_SetHigh();
    } else {
        PWM_TIMER_CTRLB &= ~FAN2_CMPEN_bm;
        ON2_SetLow();
    }
}

void fan1_set_speed(uint16_t level) {
    FAN1_CMP = level;
}

void fan2_set_speed(uint16_t level) {
    FAN2_CMP = level;
}
