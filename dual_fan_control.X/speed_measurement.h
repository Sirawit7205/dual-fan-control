#ifndef SPEED_MEASUREMENT_H
#define	SPEED_MEASUREMENT_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
#include "mcc_generated_files/timer/tcb0.h"
#include "mcc_generated_files/timer/tcb1.h"
#include "millis.h"
    
// calculation const
#define TIMER_1MS_RESOLUTION    65535UL
#define FREQ_RPM_RATIO          30      // 60 sec / 2 pulses per rotation
    
// timeout const (ms)
#define TACH_TIMEOUT            200
    
// struct
typedef struct {
    bool is_running;
    uint32_t tach_timer_cnt;
    uint32_t current_rpm;
    uint16_t (*timer_read_cnt)(void);
    void (*timer_write_cnt)(uint16_t);
    void (*timer_start)(void);
    void (*timer_stop)(void);
} tach_context_t;

// function
void tach_init();
bool tach_check_timeout_fan1();
bool tach_check_timeout_fan2();
uint32_t tach_get_rpm_fan1();
uint32_t tach_get_rpm_fan2();

#ifdef	__cplusplus
}
#endif

#endif	/* SPEED_MEASUREMENT_H */

