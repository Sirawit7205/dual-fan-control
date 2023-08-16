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
#define TIMER_1MS_RESOLUTION    32768UL
#define FREQ_RPM_RATIO          30      // 60 sec / 2 pulses per rotation
    
// timeout const (ms)
#define TACH_TIMEOUT            200
    
// struct
typedef struct TACH_CONTEXT {
    bool is_running;
    uint32_t tach_last_ms;
    uint32_t tach_last_timer_cnt;
    uint32_t current_rpm;
    uint16_t (*timer_read_cnt)(void);
} TACH_CONTEXT;

// function
void tach_Init();
bool tach_CheckTimeoutFan1();
bool tach_CheckTimeoutFan2();
uint32_t tach_GetRpmFan1();
uint32_t tach_GetRpmFan2();

#ifdef	__cplusplus
}
#endif

#endif	/* SPEED_MEASUREMENT_H */

