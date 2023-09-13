#ifndef DISPLAY_H
#define	DISPLAY_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "util/delay.h"
#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
    
// driver info
#define TM1650_CTRL_CMD         0x48
#define TM1650_DISP_BASE_CMD    0x68

// display info
#define DISPLAY_DIGITS          4
#define BRIGHTNESS_MIN          0
#define BRIGHTNESS_MAX          7
#define BRIGHTNESS_DEFAULT      2
    
// some characters mapping
#define CHAR_E      0x79
#define CHAR_F      0x71
#define CHAR_N      0x54
#define CHAR_O      0x3F
#define CHAR_P      0x73
#define CHAR_DOT    0x80
#define CHAR_DASH   0x40
#define CHAR_CLR    0x00
    
// public functions
void tm1650_clear_screen();
void tm1650_init(uint8_t brightness);
void tm1650_set_number(uint16_t number, bool leading_zero_blanking);
void tm1650_send_character(uint8_t position, uint8_t character);

#ifdef	__cplusplus
}
#endif

#endif	/* DISPLAY_H */

