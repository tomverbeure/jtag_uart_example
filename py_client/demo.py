#! /usr/bin/env python3

import sys
import time
import intel_jtag_uart


try:
    #ju = intel_jtag_uart.intel_jtag_uart("Arrow MAX 10 DECA")
    #ju = intel_jtag_uart.intel_jtag_uart(device_nr = 2)
    #ju = intel_jtag_uart.intel_jtag_uart(instance_nr = 2)
    ju = intel_jtag_uart.intel_jtag_uart()

except Exception as e:
    print(e)
    sys.exit(0)

print("error message   : ", ju.get_error_msg())

# Measure the time it takes to setup a JTAG UART connection
start = time.time()
while(not(ju.is_setup_done())):
    pass
end = time.time()

print("setup time      :  %.4fs" % (end-start))
print("cable warning   : ", ju.cable_warning())
print("info            : ", ju.get_info())
print("setup done      : ", ju.is_setup_done())

ju.write(b'hr')
time.sleep(1)
print("bytes available : ", ju.bytes_available())
print("read            : ", ju.read())

ju.close()

