#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/adc/adc1.h"
#include "trimpot.h"

adc_result_t trimpot_get_raw() {
    return ADC1_GetConversion(TRIMPOT_MUXPOS_gc);
}

uint16_t trimpot_get_scaled(uint16_t new_min, uint16_t new_max) {
    adc_result_t raw = trimpot_get_raw();
    
    if(TRIMPOT_REVERSE) {
        raw = (TRIMPOT_ADC_MIN + TRIMPOT_ADC_MAX) - raw;
    }
    
    uint32_t new_range = new_max - new_min;
    uint32_t old_range = TRIMPOT_ADC_MAX - TRIMPOT_ADC_MIN;
    return (((raw - TRIMPOT_ADC_MIN) * new_range) / old_range) + new_min;
}
