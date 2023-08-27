#include "util/delay.h"
#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
#include "display.h"

//TM1650 communication functions based on TM16xx Arduino Library
//https://github.com/maxint-rd/TM16xx
//noted that ET6226 from ETEK and UMW seems to be the same as TM1650
//these chips do not conform to I2C standard despite mentions in the datasheets

uint8_t digits[10] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x27, 0x7F, 0x6F};
uint8_t address[4] = {0x68, 0x6A, 0x6C, 0x6E};

void tm1605_send_start_bit() {
    SDA_SetHigh();
    SCL_SetHigh();
    _delay_us(5);
    SDA_SetLow();
    SCL_SetLow();
    _delay_us(5);
}

void tm1650_send_stop_bit() {
    SCL_SetLow();
    SDA_SetLow();
    _delay_us(5);
    SCL_SetHigh();
    SDA_SetHigh();
    _delay_us(5);
}

void tm1650_write_byte(uint8_t data) {
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

void tm1650_send_command(uint8_t command, uint8_t data) {
    tm1605_send_start_bit();
    tm1650_write_byte(command);
    tm1650_write_byte(data);
    tm1650_send_stop_bit();
}

void tm1650_clear_screen() {
    for(int i = 0; i < DISPLAY_DIGITS; i++) {
        tm1650_send_command(TM1650_DISP_BASE_CMD + (i * 2), 0x00);
    }
}

void tm1650_init(uint8_t brightness) {
    if(brightness < BRIGHTNESS_MIN || brightness > BRIGHTNESS_MAX) {
        brightness = BRIGHTNESS_DEFAULT;
    }
    
    tm1650_clear_screen();
    tm1650_send_command(TM1650_CTRL_CMD, (brightness << 4) | 0x01);
}

void tm1650_set_number(uint16_t number, bool leading_zero_blanking) {
    uint8_t buffer[DISPLAY_DIGITS] = {};
    for(int i = DISPLAY_DIGITS - 1; i >= 0; i--) {
        buffer[i] = number % 10;
        number = number / 10;
    }
    
    bool non_zero_found = false;
    for(int i = 0; i < DISPLAY_DIGITS; i++) {
        if(leading_zero_blanking && buffer[i] != 0) {
            non_zero_found = true;
        }
        if(!leading_zero_blanking || non_zero_found || i == DISPLAY_DIGITS - 1) {
            tm1650_send_command(TM1650_DISP_BASE_CMD + (i * 2), digits[buffer[i]]);
        } else {
            tm1650_send_command(TM1650_DISP_BASE_CMD + (i * 2), 0x00);
        }
    }
}

void tm1650_send_character(uint8_t position, uint8_t character) {
    if(position >= DISPLAY_DIGITS) {
        return;     //digit does not exist
    }
    tm1650_send_command(TM1650_DISP_BASE_CMD + (position * 2), character);
}
