#include <stdint.h>
#include <math.h>

#include "jtag_uart.h"

#include "top_defines.h"
#include "reg.h"

// Check if that JTAG UART is supported by the design.
static inline int has_jtag_uart()
{
    return REG_RD_FIELD(STATUS, JTAG_UART);
}

// Transmit 1 character
void jtag_uart_tx_char(const char c)
{
    uint32_t val;

    if (!has_jtag_uart())
        return;

    // Stall until there's space in the write FIFO
    while((val = REG_RD_FIELD(JTAG_UART_CONTROL, WSPACE)) == 0);
    REG_WR(JTAG_UART_DATA, c);
}

// Transmit a zero-terminated string
void jtag_uart_tx_str(const char *str)
{
    while(*str != 0){
        jtag_uart_tx_char(*str);
        ++str;
    }
}

// Receive 1 character, if there is one
int jtag_uart_rx_get_char(uint8_t *c)
{
    if (!has_jtag_uart())
        return 0;

    int data = REG_RD(JTAG_UART_DATA);

    if ( ((data >> JTAG_UART_DATA_RVALID_FIELD_START)&1) ){
        *c = data & 255;
        return 1UL;
    }
    else{
        return 0UL;
    }
}


