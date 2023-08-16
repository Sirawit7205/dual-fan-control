#ifndef SPEED_CONTROL_H
#define	SPEED_CONTROL_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
    
// PWM timer information
#define PWM_TIMER_PER       TCA0_SINGLE_PER
#define PWM_TIMER_CTRLB     TCA0_SINGLE_CTRLB
#define FAN1_CMP            TCA0_SINGLE_CMP1
#define FAN2_CMP            TCA0_SINGLE_CMP0
#define FAN1_CMPEN_bm       TCA_SINGLE_CMP1EN_bm
#define FAN2_CMPEN_bm       TCA_SINGLE_CMP0EN_bm

// public function
uint16_t pwm_get_max_range();
void fan1_power(bool on);
void fan2_power(bool on);
void fan1_set_speed(uint16_t level);
void fan2_set_speed(uint16_t level);

#ifdef	__cplusplus
}
#endif

#endif	/* SPEED_CONTROL_H */

