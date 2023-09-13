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
#include "user_interface.h"

/*
    Main application
*/

int main(void)
{
    SYSTEM_Initialize();
    
    millis_init();
    tach_init();
    tm1650_init(BRIGHTNESS_DEFAULT);
    ui_init();
    
    uint32_t start_millis = millis();
    
    while(1)
    {
        wdt_reset();
        
        //get and set speed
        uint16_t speed_level = trimpot_get_scaled(0, pwm_get_max_range());
        fan1_set_speed(speed_level);
        fan2_set_speed(speed_level);
        
        //detect if pot changes enough and show on display
        uint16_t speed_percent = trimpot_get_scaled(0, 100);
        ui_update_pot_data(speed_percent);
        
        //check rotor lock and speed
        bool fan1_timeout = tach_check_timeout_fan1();
        bool fan2_timeout = tach_check_timeout_fan2();
        uint32_t fan1_rpm = tach_get_rpm_fan1();
        uint32_t fan2_rpm = tach_get_rpm_fan2();
        ui_update_tach_data(!fan1_timeout, fan1_rpm, !fan2_timeout, fan2_rpm);
        
        //turn off fan if timeout
        if(fan1_timeout) {
            fan1_power(false);
        }
        if(fan2_timeout) {
            fan2_power(false);
        }
        
        //detect button presses
        if(!BTN_SEL_GetValue()) {
            ui_update_sel_btn();
            start_millis = millis();
            while(!is_timed_out(start_millis, 500));
        }
        if(!BTN_ON_GetValue()) {
            ui_update_pwr_btn();
            start_millis = millis();
            while(!is_timed_out(start_millis, 500));
        }
        
        //commit display changes
        ui_update_state();
    }
}