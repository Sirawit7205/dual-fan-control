#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
#include "mcc_generated_files/timer/tcb0.h"
#include "mcc_generated_files/timer/tcb1.h"
#include "millis.h"
#include "speed_measurement.h"

volatile tach_context_t fan1_context;
volatile tach_context_t fan2_context;

void tach_calculate_speed_cb(volatile tach_context_t *context) {
    //calculate speed in RPM from pulse width
    //speed = frequency * 30
    //frequency = 1 / period
    //period = (now_millis + now_tcb) - (start_millis + start_tcb)
    //speed(rpm) = (tcb_1ms * 1000 * 30) / ((diff_ms * tcb_1ms) + diff_frag)
    ENTER_CRITICAL(R);
    uint16_t cnt_fragment = context->timer_read_cnt();
    context->timer_write_cnt(0);
    
    context->current_rpm = (TIMER_1MS_RESOLUTION * 1000 * FREQ_RPM_RATIO) /
            ((context->tach_timer_cnt * TIMER_1MS_RESOLUTION) + cnt_fragment);
    context->tach_timer_cnt = 0;
    
    //start timer in case timer is not running
    context->timer_start();
    context->is_running = true;
    EXIT_CRITICAL(R);
}

void tach_timer_count_cb(volatile tach_context_t *context) {
    ENTER_CRITICAL(R);
    context->tach_timer_cnt++;
    EXIT_CRITICAL(R);
}

bool tach_check_timeout(volatile tach_context_t *context) {
    if(!context->is_running) {
        return true;
    }
    
    bool timeout;
    ENTER_CRITICAL(R);
    if(context->tach_timer_cnt > TACH_TIMEOUT) {
        //clear data and stop timer
        context->timer_stop();
        context->timer_write_cnt(0);
        context->is_running = false;
        context->tach_timer_cnt = 0;
        context->current_rpm = 0;
        timeout = true;
    } else {
        //continue
        timeout = false;
    }
    EXIT_CRITICAL(R);
    return timeout;
}

void tach_calculate_speed_fan1() {
    tach_calculate_speed_cb(&fan1_context);
}

void tach_calculate_speed_fan2() {
    tach_calculate_speed_cb(&fan2_context);
}

void tach_timer_count_fan1() {
    tach_timer_count_cb(&fan1_context);
}

void tach_timer_count_fan2() {
    tach_timer_count_cb(&fan2_context);
}

void tach_init() {
    TACH1_SetInterruptHandler(tach_calculate_speed_fan1);
    TACH2_SetInterruptHandler(tach_calculate_speed_fan2);
    TACH1_TIMER_CaptureCallbackRegister(tach_timer_count_fan1);
    TACH2_TIMER_CaptureCallbackRegister(tach_timer_count_fan2);
    
    fan1_context.is_running = false;
    fan1_context.tach_timer_cnt = 0;
    fan1_context.current_rpm = 0;
    fan1_context.timer_read_cnt = TACH1_TIMER_Read;
    fan1_context.timer_write_cnt = TACH1_TIMER_Write;
    fan1_context.timer_start = TACH1_TIMER_Start;
    fan1_context.timer_stop = TACH1_TIMER_Stop;
    
    fan2_context.is_running = false;
    fan2_context.tach_timer_cnt = 0;
    fan2_context.current_rpm = 0;
    fan2_context.timer_read_cnt = TACH2_TIMER_Read;
    fan2_context.timer_write_cnt = TACH2_TIMER_Write;
    fan2_context.timer_start = TACH2_TIMER_Start;
    fan2_context.timer_stop = TACH2_TIMER_Stop;
}

bool tach_check_timeout_fan1() {
    return tach_check_timeout(&fan1_context);
}

bool tach_check_timeout_fan2() {
    return tach_check_timeout(&fan2_context);
}

uint32_t tach_get_rpm_fan1() {
    ENTER_CRITICAL(R);
    uint32_t temp_rpm = fan1_context.current_rpm;
    EXIT_CRITICAL(R);
    return temp_rpm;
}

uint32_t tach_get_rpm_fan2() {
    ENTER_CRITICAL(R);
    uint32_t temp_rpm = fan2_context.current_rpm;
    EXIT_CRITICAL(R);
    return temp_rpm;
}
