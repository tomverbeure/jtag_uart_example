#include <stdint.h>
#include <stdlib.h>

#include "riscv.h"
#include "reg.h"
#include "top_defines.h"
#include "lib.h"
#include "jtag_uart.h"

void wait_led_cycle(int ms)
{
    if (REG_RD_FIELD(STATUS, SIMULATION) == 1){
        // Wait for a much shorter time when simulation...
        wait_cycles(100);
    }
    else{
        wait_ms(ms);
    }
}

void help()
{
    jtag_uart_tx_str(
            "r:     reverse LED toggle sequence\n"
            "\n"
        );
}

int main() 
{
    jtag_uart_tx_str("Hello World!\n");

    int reverse_dir = 0;

    while(1){
        int wait_time = REG_RD_FIELD(STATUS, BUTTON) ? 200 : 100;

        int ret;
        do{
            unsigned char c;
            ret = jtag_uart_rx_get_char(&c);
            if (ret != 0){
                jtag_uart_tx_str("Command: ");
                jtag_uart_tx_char(c);
                jtag_uart_tx_char('\n');

                if (c == 'r'){
                    jtag_uart_tx_str("Reversing LED sequence...\n");            
                    reverse_dir ^= 1;
                }
                else{
                    help();
                }
            }
        } while(ret != 0);

        if (reverse_dir){
            REG_WR(LED_CONFIG, 0x04);
            wait_led_cycle(wait_time);
    
            REG_WR(LED_CONFIG, 0x02);
            wait_led_cycle(wait_time);
    
            REG_WR(LED_CONFIG, 0x01);
            wait_led_cycle(wait_time);
        }
        else{
            REG_WR(LED_CONFIG, 0x01);
            wait_led_cycle(wait_time);
    
            REG_WR(LED_CONFIG, 0x02);
            wait_led_cycle(wait_time);
    
            REG_WR(LED_CONFIG, 0x04);
            wait_led_cycle(wait_time);
        }
    }
}
