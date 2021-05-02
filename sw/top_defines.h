
#ifndef TOP_DEFINES_H
#define TOP_DEFINES_H

//============================================================
// LED
//============================================================

#define LED_CONFIG_ADDR             0x80000000

#define LED_CONFIG_VALUE_FIELD_START                    0
#define LED_CONFIG_VALUE_FIELD_LENGTH                   3

//============================================================
// STATUS
//============================================================

#define STATUS_ADDR                 0x80000004

#define STATUS_BUTTON_FIELD_START                       0
#define STATUS_BUTTON_FIELD_LENGTH                      1

#define STATUS_SIMULATION_FIELD_START                   1
#define STATUS_SIMULATION_FIELD_LENGTH                  1

#define STATUS_JTAG_UART_FIELD_START                    2
#define STATUS_JTAG_UART_FIELD_LENGTH                   1

//============================================================
// JTAG_UART
//============================================================

#define JTAG_UART_DATA_ADDR         0x90000000

#define JTAG_UART_DATA_DATA_FIELD_START                         0
#define JTAG_UART_DATA_DATA_FIELD_LENGTH                        8

#define JTAG_UART_DATA_RVALID_FIELD_START                       15
#define JTAG_UART_DATA_RVALID_FIELD_LENGTH                      1

#define JTAG_UART_DATA_RAVAIL_FIELD_START                       16
#define JTAG_UART_DATA_RAVAIL_FIELD_LENGTH                      16

#define JTAG_UART_CONTROL_ADDR      0x90000004

#define JTAG_UART_CONTROL_RE_FIELD_START                        0
#define JTAG_UART_CONTROL_RE_FIELD_LENGTH                       1

#define JTAG_UART_CONTROL_WE_FIELD_START                        1
#define JTAG_UART_CONTROL_WE_FIELD_LENGTH                       1

#define JTAG_UART_CONTROL_RI_FIELD_START                        8
#define JTAG_UART_CONTROL_WI_FIELD_LENGTH                       1

#define JTAG_UART_CONTROL_AC_FIELD_START                        9
#define JTAG_UART_CONTROL_AC_FIELD_LENGTH                       1

#define JTAG_UART_CONTROL_WSPACE_FIELD_START                    16
#define JTAG_UART_CONTROL_WSPACE_FIELD_LENGTH                   16

#endif



