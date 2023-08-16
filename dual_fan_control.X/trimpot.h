#ifndef TRIMPOT_H
#define	TRIMPOT_H

#ifdef	__cplusplus
extern "C" {
#endif
    
#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/adc/adc1.h"

// trimpot input
#define TRIMPOT_MUXPOS_gc       ADC_MUXPOS_AIN0_gc
    
// define to enable reverse scaling
// i.e. higher ADC values cause PWM duty cycle to decrease
#define TRIMPOT_REVERSE         true
    
// ADC info
//ADC1_GetResolution is wrong so we need to manually define the range here
#define TRIMPOT_ADC_MIN         0
#define TRIMPOT_ADC_MAX         1023
    
// public functions
adc_result_t trimpot_get_raw();
uint16_t trimpot_get_scaled(uint16_t new_min, uint16_t new_max);


#ifdef	__cplusplus
}
#endif

#endif	/* TRIMPOT_H */

