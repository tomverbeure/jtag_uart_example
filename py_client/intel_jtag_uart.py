#! /usr/bin/env python3

import ctypes
import sys
import time
from ctypes import *
from sys import platform

libjtag_client_path   = './libjtag_client.so'
libjtag_atlantic_path = './libjtag_atlantic.so'

try:
    # https://stackoverflow.com/questions/2327344/ctypes-loading-a-c-shared-library-that-has-dependencies
    # Use RTLD_GLOBAL to load the libjtag_client symbols into a global symbol space.
    # If you don't do this, then libjtag_atlantic can't find symbols from libjtag_client.
    libjtag_client      = ctypes.CDLL(libjtag_client_path, mode=RTLD_GLOBAL)
    libjtag_atlantic    = ctypes.CDLL(libjtag_atlantic_path)

except Exception as e:
    print(e)
    sys.exit(0)

class intel_jtag_uart:

    ERROR_MSGS = [
        "No error",
        "Unable to connect to local JTAG server",
        "More than one cable available, provide more specific cable name",
        "Cable not available",
        "Selected cable is not plugged",
        "JTAG not connected to board, or board powered down",
        "Another program is already using the UART",
        "More than one UART available, specify device/instance",
        "No UART matching the specified device/instance",
        "Selected UART is not compatible with this version of the library"
    ]

    function_table = {
        'jtagatlantic_open'             : { 
            'linux'         : '_Z17jtagatlantic_openPKciiS0_',
            'windows'       : '?jtagatlantic_open@@YAPEAUJTAGATLANTIC@@PEBDHH0@Z',
            'argtypes'      : [ctypes.c_char_p, ctypes.c_int, ctypes.c_int, ctypes.c_char_p],
            'restype'       : ctypes.c_void_p,
        },
        'jtagatlantic_read'             : { 
            'linux'         : '_Z17jtagatlantic_readP12JTAGATLANTICPcj',
            'windows'       : '?jtagatlantic_read@@YAHPEAUJTAGATLANTIC@@PEADI@Z',
            'argtypes'      : [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_uint],
            'restype'       : ctypes.c_int
        },
        'jtagatlantic_close'            : { 
            'linux'         : '_Z18jtagatlantic_closeP12JTAGATLANTIC',
            'windows'       : '?jtagatlantic_close@@YAXPEAUJTAGATLANTIC@@@Z',
            'argtypes'      :  [ctypes.c_void_p],
            'restype'       :  None
        },
        'jtagatlantic_flush'            : { 
            'linux'         : '_Z18jtagatlantic_flushP12JTAGATLANTIC',
            'windows'       : '?jtagatlantic_flush@@YAHPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       :  None
        },
        'jtagatlantic_write'            : { 
            'linux'         : '_Z18jtagatlantic_writeP12JTAGATLANTICPKcj',
            'windows'       : '?jtagatlantic_write@@YAHPEAUJTAGATLANTIC@@PEBDI@Z',
            'argtypes'      : [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_uint],
            'restype'       : ctypes.c_int
        },
        'jtagatlantic_get_info'         : { 
            'linux'         : '_Z21jtagatlantic_get_infoP12JTAGATLANTICPPKcPiS4_',
            'windows'       : '?jtagatlantic_get_info@@YAXPEAUJTAGATLANTIC@@PEAPEBDPEAH2@Z',
            'argtypes'      : [ ctypes.c_void_p, POINTER(ctypes.c_char_p), POINTER(ctypes.c_int), POINTER(ctypes.c_int) ],
            'restype'       : None,
        },
        'jtagatlantic_get_error'        : { 
            'linux'         : '_Z22jtagatlantic_get_errorPPKc',
            'windows'       : '?jtagatlantic_get_error@@YA?AW4JATL_ERROR@@PEAPEBD@Z',
            'argtypes'      : [POINTER(ctypes.c_char_p)], 
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_wait_open'        : { 
            'linux'         : '_Z22jtagatlantic_wait_openP12JTAGATLANTIC',
            'windows'       : '?jtagatlantic_wait_open@@YAHPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_scan_thread'      : { 
            'linux'         : '_Z24jtagatlantic_scan_threadP12JTAGATLANTIC',
            'windows'       : '?jtagatlantic_scan_thread@@YAXPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_cable_warning'    : { 
            'linux'         : '_Z26jtagatlantic_cable_warningP12JTAGATLANTIC',
            'windows'       : '?jtagatlantic_cable_warning@@YAHPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_is_setup_done'    : { 
            'linux'         : '_Z26jtagatlantic_is_setup_doneP12JTAGATLANTIC',
            'windows'       : '?jtagatlantic_is_setup_done@@YA_NPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_bytes_available'  : { 
            'linux'         : '_Z28jtagatlantic_bytes_availableP12JTAGATLANTIC',
            'windows'       : '?jtagatlantic_bytes_available@@YAHPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
    }

    @classmethod
    def setup_functions(cls):

        for (func_name, func_info) in cls.function_table.items():
            if 'argtypes' not in func_info: 
                continue

            if 'restype' not in func_info: 
                continue

            func_ptr            = libjtag_atlantic[func_info['linux']]
            func_ptr.argtypes   = func_info['argtypes']
            func_ptr.restype    = func_info['restype']
            func_info['ptr']    = func_ptr


    def __init__(self, cable = None, device_nr = -1, instance_nr = -1, exe_name = None):

        self.exe_name   = exe_name
        
        self.handle     = intel_jtag_uart.function_table['jtagatlantic_open']['ptr'](
                            ctypes.c_char_p(cable), 
                            ctypes.c_int(device_nr), 
                            ctypes.c_int(instance_nr), 
                            ctypes.c_char_p(exe_name)
                        )

    def close(self):
        intel_jtag_uart.function_table['jtagatlantic_close']['ptr'](
                            self.handle
                        )

    def get_error_nr(self):
        other_info = c_char_p()
        err = intel_jtag_uart.function_table['jtagatlantic_get_error']['ptr'](byref(other_info))

        return err

    def get_error_msg(self):
        err = self.get_error_nr()
        if err >= -9 and err <= 0:
            return intel_jtag_uart.ERROR_MSGS[-err]

        return None

    def get_info(self):
        cable_name  = c_char_p()
        device_nr   = c_int()
        instance_nr = c_int()

        intel_jtag_uart.function_table['jtagatlantic_get_info']['ptr'](
                            self.handle,
                            byref(cable_name),
                            byref(device_nr),
                            byref(instance_nr)
                        )

        return [cable_name.value.decode("utf-8") , device_nr.value, instance_nr.value ]

    def write(self, data_bytes, flush = True):
        bytes_written = intel_jtag_uart.function_table['jtagatlantic_write']['ptr'](
                            self.handle,
                            ctypes.c_char_p(data_bytes),
                            ctypes.c_uint(len(data_bytes))
                        )
        if flush:
            self.flush()

    def read(self):
        buf_len     = self.bytes_available()
        buf         = bytes(buf_len)

        bytes_read = intel_jtag_uart.function_table['jtagatlantic_read']['ptr'](
                            self.handle,
                            ctypes.c_char_p(buf),
                            ctypes.c_uint(buf_len)
                        )

        return buf

    def flush(self):
        intel_jtag_uart.function_table['jtagatlantic_flush']['ptr'](
                            self.handle
                        )

    def bytes_available(self):
        nr_bytes = intel_jtag_uart.function_table['jtagatlantic_bytes_available']['ptr'](
                            self.handle
                        )
        return nr_bytes

    def cable_warning(self):
        status = intel_jtag_uart.function_table['jtagatlantic_cable_warning']['ptr'](
                            self.handle
                        )
        return status

    def is_setup_done(self):
        status = intel_jtag_uart.function_table['jtagatlantic_is_setup_done']['ptr'](
                            self.handle
                        )
        return status != 0

    # NOTE: I've never seen this return a value other than 0
    def wait_open(self):
        status = intel_jtag_uart.function_table['jtagatlantic_wait_open']['ptr'](
                            self.handle
                        )
        return status

    # NOTE: implemented for completeness. Use case unknown.
    def scan_thread(self):
        status = intel_jtag_uart.function_table['jtagatlantic_scan_thread']['ptr'](
                            self.handle
                        )
        return status

intel_jtag_uart.setup_functions()

ju = intel_jtag_uart()

# Measure the time it takes to setup a JTAG UART connection
start = time.time()
while(not(ju.is_setup_done())):
    pass
end = time.time()
print(end-start)

print(ju.cable_warning())

print(ju.get_error_msg())
print(ju.get_info())

ju.write(b'hr')
time.sleep(1)
print("Bytes available: ", ju.bytes_available())
print(ju.read())
print(ju.is_setup_done())

ju.close()


