#ifndef JTAG_UART_H
#define JTAG_UART_H

void jtag_uart_tx_char(const char c);
void jtag_uart_tx_str(const char *str);
int  jtag_uart_rx_get_char(uint8_t *c);

#endif
