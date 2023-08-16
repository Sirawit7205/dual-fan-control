#ifndef MILLIS_H
#define	MILLIS_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/timer/rtc.h"
#include "mcc_generated_files/timer/tcb0.h"
#include "mcc_generated_files/timer/tcb1.h"
    
// public functions
void millis_init();
uint32_t millis();
bool is_timed_out(uint32_t start, uint32_t duration);
    
#ifdef	__cplusplus
}
#endif

#endif	/* MILLIS_H */

