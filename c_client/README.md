
This code is based on the example from the [thotypous/alterajtaguart](https://github.com/thotypous/alterajtaguart) 
project.

It creates a `jtag_uart_send_cmd` file to send single string commands to the JTAG UART, and
the print everything that's returned.

```
jtag_uart_send_cmd [-c <cable_name>] [-d <device nr>] [-i <instance nr>] <command>
```

If `libjtag_atlantic.so` or `libjtag_client.so` are not in your `$LD_LIBRARY_PATH` environment variable,
you should run the tool as follows:

```sh
LD_LIBRARY_PATH=$QUARTUS_ROOTDIR/linux64 ./jtag_uart_send_cmd
```

