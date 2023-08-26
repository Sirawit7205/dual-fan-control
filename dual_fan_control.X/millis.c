#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/timer/rtc.h"
#include "mcc_generated_files/timer/tcb0.h"
#include "mcc_generated_files/timer/tcb1.h"
#include "millis.h"

volatile uint32_t current_millis = 0;

void millis_counter_cb() {
    ENTER_CRITICAL(R);
    current_millis++;
    EXIT_CRITICAL(R);
}

void millis_init() {
    RTC_SetOVFIsrCallback(millis_counter_cb);
}

uint32_t millis() {
    ENTER_CRITICAL(R);
    uint32_t millis_copy = current_millis;
    EXIT_CRITICAL(R);
    return millis_copy;
}

bool is_timed_out(uint32_t start, uint32_t duration) {
    return (uint32_t)(millis() - start) > duration;
}
