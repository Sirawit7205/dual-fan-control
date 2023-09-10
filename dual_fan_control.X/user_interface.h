#ifndef USER_INTERFACE_H
#define	USER_INTERFACE_H

#ifdef	__cplusplus
extern "C" {
#endif

#include "mcc_generated_files/system/utils/atomic.h"
#include "mcc_generated_files/system/utils/compiler.h"
#include "mcc_generated_files/system/pins.h"
#include "display.h"
#include "millis.h"
    
// display constant
#define ANIMATION_PERIOD    200
#define RPM_PERIOD          1000
#define ON_OFF_PERIOD       2000

#define ANIMATION_STEPS     3
    
// display state
typedef enum {
    BTN_LEFT, BTN_CENTER, BTN_RIGHT
} btn_state_enum;

typedef enum {
    DISP_CENTER, DISP_RPM_LEFT, DISP_RPM_RIGHT, DISP_PWM, DISP_ON, DISP_OFF
} disp_state_enum;

//structure
typedef struct {
    uint8_t animation_step;
    uint32_t fan_rpm;
    bool fan_on;
} ui_side_context_t;

typedef struct {
    btn_state_enum button_state;
    disp_state_enum display_state;
    uint32_t display_millis;
    bool state_changed;
    ui_side_context_t left_side;
    ui_side_context_t right_side;
} ui_display_context_t;

//public functions
void ui_init();
void ui_update_sel_btn();
void ui_update_pwr_btn();
void ui_update_data(bool fan1_on, uint32_t fan1_rpm, bool fan2_on, uint32_t fan2_rpm);
void ui_update_state();
btn_state_enum ui_get_button_state();

#ifdef	__cplusplus
}
#endif

#endif	/* USER_INTERFACE_H */

