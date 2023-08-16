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
#define CHAR_n      0x54
#define CHAR_O      0x3F
#define CHAR_o      0x5C
    
// public functions
void TM1650_ClearScreen();
void TM1650_Setup(uint8_t brightness);
void TM1650_SetNumber(uint16_t number, bool leadingZeroBlanking);
void TM1650_SetCharacter(uint8_t position, uint8_t character);

#ifdef	__cplusplus
}
#endif

#endif	/* DISPLAY_H */
