#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
#include "mcc_generated_files/timer/tcb0.h"
#include "mcc_generated_files/timer/tcb1.h"
#include "millis.h"
#include "speed_measurement.h"

volatile TACH_CONTEXT fan1_context = {false, 0, 0, 0, TACH0_TIMER_Read};
volatile TACH_CONTEXT fan2_context = {false, 0, 0, 0, TACH1_TIMER_Read};

void tach_CalculateSpeed(volatile TACH_CONTEXT *context) {
    uint32_t tach_current_ms = millis();
    ENTER_CRITICAL(R);
    uint32_t tach_current_timer_cnt = context->timer_read_cnt();
    
    //initial values
    if(!context->is_running) {
        context->is_running = true;
        context->tach_last_ms = tach_current_ms;
        context->tach_last_timer_cnt = tach_current_timer_cnt;
        EXIT_CRITICAL(R);
        return;
    }
    
    //adjust timer cnt
    if(tach_current_timer_cnt < context->tach_last_timer_cnt) {
        tach_current_ms--;
        tach_current_timer_cnt += TIMER_1MS_RESOLUTION;
    }
    
    //calculate speed in RPM from pulse width
    //speed = frequency * 30
    //frequency = 1 / period
    //period = (now_millis + now_tcb) - (start_millis + start_tcb)
    //speed(rpm) = (tcb_1ms * 1000 * 30) / ((diff_ms * tcb_1ms) + diff_us)
    context->current_rpm = (TIMER_1MS_RESOLUTION * 1000 * FREQ_RPM_RATIO) /
        (((tach_current_ms - context->tach_last_ms) * TIMER_1MS_RESOLUTION) +
        (tach_current_timer_cnt - context->tach_last_timer_cnt));
    context->tach_last_ms = tach_current_ms;
    context->tach_last_timer_cnt = tach_current_timer_cnt;
    EXIT_CRITICAL(R);
}

void tach_CalculateSpeedFan1() {
    tach_CalculateSpeed(&fan1_context);
}

void tach_CalculateSpeedFan2() {
    tach_CalculateSpeed(&fan2_context);
}

void tach_Init() {
    TACH1_SetInterruptHandler(tach_CalculateSpeedFan1);
    TACH2_SetInterruptHandler(tach_CalculateSpeedFan2);
}

bool tach_CheckTimeoutFan1() {
    if(!fan1_context.is_running) {
        return false;
    }
    
    bool timeout;
    uint32_t current_millis = millis();
    ENTER_CRITICAL(R);
    if((uint32_t)(current_millis - fan1_context.tach_last_ms) > TACH_TIMEOUT) {
        fan1_context.is_running = false;
        fan1_context.current_rpm = 0;
        timeout = true;
    } else {
        timeout = false;
    }
    EXIT_CRITICAL(R);
    
    return timeout;
}

bool tach_CheckTimeoutFan2() {
    if(!fan2_context.is_running) {
        return false;
    }
    
    bool timeout;
    uint32_t current_millis = millis();
    ENTER_CRITICAL(R);
    if((uint32_t)(current_millis - fan2_context.tach_last_ms) > TACH_TIMEOUT) {
        fan2_context.is_running = false;
        fan2_context.current_rpm = 0;
        timeout = true;
    } else {
        timeout = false;
    }
    EXIT_CRITICAL(R);
    
    return timeout;
}

uint32_t tach_GetRpmFan1() {
    ENTER_CRITICAL(R);
    uint32_t temp_rpm = fan1_context.current_rpm;
    EXIT_CRITICAL(R);
    return temp_rpm;
}

uint32_t tach_GetRpmFan2() {
    ENTER_CRITICAL(R);
    uint32_t temp_rpm = fan2_context.current_rpm;
    EXIT_CRITICAL(R);
    return temp_rpm;
}
