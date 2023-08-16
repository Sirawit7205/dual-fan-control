 /*
 * MAIN Generated Driver File
 * 
 * @file main.c
 * 
 * @defgroup main MAIN
 * 
 * @brief This is the generated driver implementation file for the MAIN driver.
 *
 * @version MAIN Driver Version 1.0.0
*/

/*
? [2023] Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip 
    software and any derivatives exclusively with Microchip products. 
    You are responsible for complying with 3rd party license terms  
    applicable to your use of 3rd party software (including open source  
    software) that may accompany Microchip software. SOFTWARE IS ?AS IS.? 
    NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS 
    SOFTWARE, INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT,  
    MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT 
    WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY 
    KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF 
    MICROCHIP HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE 
    FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP?S 
    TOTAL LIABILITY ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT 
    EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR 
    THIS SOFTWARE.
*/
#define F_CPU 16000000UL
#include "mcc_generated_files/system/system.h"
#include "avr/wdt.h"
#include "util/delay.h"
#include "display.h"
#include "millis.h"
#include "speed_controller.h"
#include "speed_measurement.h"
#include "trimpot.h"

/*
    Main application
*/

int main(void)
{
    SYSTEM_Initialize();
    
    millis_init();
    tach_Init();
    TM1650_Setup(BRIGHTNESS_DEFAULT);
    
    bool fan1_is_on = false, fan2_is_on = false;
    bool is_left = true;
    uint32_t start_millis;
    uint32_t display_millis = millis();
    LED_FAN1_SetLow();
    
    while(1)
    {
        wdt_reset();
        
        //get and set speed
        uint16_t speed_level = trimpot_get_scaled(0, pwm_get_max_range());
        fan1_set_speed(speed_level);
        fan2_set_speed(speed_level);
        
        //check rotor lock
        tach_CheckTimeoutFan1();
        tach_CheckTimeoutFan2();
        
        //show RPM
        if(is_timed_out(display_millis, 1000)) {
            display_millis = millis();
            if(is_left) {
                TM1650_SetNumber(tach_GetRpmFan1(), true);
            } else {
                TM1650_SetNumber(tach_GetRpmFan2(), true);
            }
        }
        
        //toggle side
        if(!BTN_SEL_GetValue()) {
            if(is_left) {
                is_left = false;
                LED_FAN1_SetHigh();
                LED_FAN2_SetLow();
            } else {
                is_left = true;
                LED_FAN1_SetLow();
                LED_FAN2_SetHigh();
            }
            start_millis = millis();
            while(!is_timed_out(start_millis, 500));
        }
        
        //turn on and off
        if(!BTN_ON_GetValue()) {
            if(is_left) {
                fan1_is_on = !fan1_is_on;
                fan1_power(fan1_is_on);
            } else {
                fan2_is_on = !fan2_is_on;
                fan2_power(fan2_is_on);
            }
            start_millis = millis();
            while(!is_timed_out(start_millis, 500));
        }
    }

}