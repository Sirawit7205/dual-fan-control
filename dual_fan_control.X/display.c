#include "util/delay.h"
#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
#include "display.h"

uint8_t digits[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x27, 0x7F, 0x6F};
uint8_t address[4] = {0x68, 0x6A, 0x6C, 0x6E};

void TM1650_SendStartBit() {
    SDA_SetHigh();
    SCL_SetHigh();
    _delay_us(5);
    SDA_SetLow();
    SCL_SetLow();
    _delay_us(5);
}

void TM1650_SendStopBit() {
    SCL_SetLow();
    SDA_SetLow();
    _delay_us(5);
    SCL_SetHigh();
    SDA_SetHigh();
    _delay_us(5);
}

void TM1650_WriteByte(uint8_t data) {
    //send
    for(int i = 0; i < 8; i++) {
        SCL_SetLow();
        _delay_us(5);
        
        if(data & 0x80) {
            SDA_SetHigh();
        } else {
            SDA_SetLow();
        }
        data = data << 1;
        _delay_us(5);
        
        SCL_SetHigh();
        _delay_us(5);
    }
    _delay_us(5);
    _delay_us(5);
    
    //ack
    SCL_SetLow();
    SDA_SetDigitalInput();
    _delay_us(5);
    SCL_SetHigh();
    _delay_us(5);
    uint8_t ack = SDA_GetValue();
    if(ack == 0) {
        SDA_SetLow();
    }
    SDA_SetDigitalOutput();
}

void TM1650_SendCommand(uint8_t command, uint8_t data) {
    TM1650_SendStartBit();
    TM1650_WriteByte(command);
    TM1650_WriteByte(data);
    TM1650_SendStopBit();
}

void TM1650_ClearScreen() {
    for(int i = 0; i < DISPLAY_DIGITS; i++) {
        TM1650_SendCommand(TM1650_DISP_BASE_CMD + (i * 2), 0x00);
    }
}

void TM1650_Setup(uint8_t brightness) {
    if(brightness < BRIGHTNESS_MIN || brightness > BRIGHTNESS_MAX) {
        brightness = BRIGHTNESS_DEFAULT;
    }
    
    TM1650_ClearScreen();
    TM1650_SendCommand(TM1650_CTRL_CMD, (brightness << 4) | 0x01);
}

void TM1650_SetNumber(uint16_t number, bool leadingZeroBlanking) {
    uint8_t buffer[DISPLAY_DIGITS] = {};
    for(int i = DISPLAY_DIGITS - 1; i >= 0; i--) {
        buffer[i] = number % 10;
        number = number / 10;
    }
    
    bool nonZeroFound = false;
    for(int i = 0; i < DISPLAY_DIGITS; i++) {
        if(leadingZeroBlanking && buffer[i] != 0) {
            nonZeroFound = true;
        }
        if(!leadingZeroBlanking || nonZeroFound || i == DISPLAY_DIGITS - 1) {
            TM1650_SendCommand(TM1650_DISP_BASE_CMD + (i * 2), digits[buffer[i]]);
        } else {
            TM1650_SendCommand(TM1650_DISP_BASE_CMD + (i * 2), 0x00);
        }
    }
}

void TM1650_SetCharacter(uint8_t position, uint8_t character) {
    if(position >= DISPLAY_DIGITS) {
        return;     //digit does not exist
    }
    TM1650_SendCommand(TM1650_DISP_BASE_CMD + (position * 2), character);
}
