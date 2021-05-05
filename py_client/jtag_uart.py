#! /usr/bin/env python3

import ctypes
import sys
from ctypes import *
from sys import platform

libjtag_client_path   = './libjtag_client.so'
libjtag_atlantic_path = './libjtag_atlantic.so'

mangle_table = {
        'jtagatlantic_open'             : '_Z17jtagatlantic_openPKciiS0_',
        'jtagatlantic_read'             : '_Z17jtagatlantic_readP12JTAGATLANTICPcj',
        'jtagatlantic_close'            : '_Z18jtagatlantic_closeP12JTAGATLANTIC',
        'jtagatlantic_flush'            : '_Z18jtagatlantic_flushP12JTAGATLANTIC',
        'jtagatlantic_write'            : '_Z18jtagatlantic_writeP12JTAGATLANTICPKcj',
        'jtagatlantic_get_info'         : '_Z21jtagatlantic_get_infoP12JTAGATLANTICPPKcPiS4_',
        'jtagatlantic_get_error'        : '_Z22jtagatlantic_get_errorPPKc',
        'jtagatlantic_wait_open'        : '_Z22jtagatlantic_wait_openP12JTAGATLANTIC',
        'jtagatlantic_scan_thread'      : '_Z24jtagatlantic_scan_threadP12JTAGATLANTIC',
        'jtagatlantic_cable_warning'    : '_Z26jtagatlantic_cable_warningP12JTAGATLANTIC',
        'jtagatlantic_is_setup_done'    : '_Z26jtagatlantic_is_setup_doneP12JTAGATLANTIC',
        'jtagatlantic_bytes_available'  : '_Z28jtagatlantic_bytes_availableP12JTAGATLANTIC',
    }

try:
    # https://stackoverflow.com/questions/2327344/ctypes-loading-a-c-shared-library-that-has-dependencies
    # Use RTLD_GLOBAL to load the libjtag_client symbols into a global symbol space.
    # If you don't do this, then libjtag_atlantic can't find symbols from libjtag_client.
    libjtag_client      = ctypes.CDLL(libjtag_client_path, mode=RTLD_GLOBAL)
    libjtag_atlantic    = ctypes.CDLL(libjtag_atlantic_path)

except Exception as e:
    print(e)
    sys.exit(0)


print(libjtag_atlantic)

"""
JTAGATLANTIC * jtagatlantic_open (
    const char * chain,
    int device_index,
    int link_instance,
    const char * app_name);
"""
JAOpen = libjtag_atlantic[mangle_table['jtagatlantic_open']]
JAOpen.argtypes = [ctypes.c_char_p, ctypes.c_int, ctypes.c_int, ctypes.c_char_p]
JAOpen.restype = ctypes.c_void_p

"""
int  jtagatlantic_get_error (const char **other_info);
"""
JAGetError = libjtag_atlantic[mangle_table['jtagatlantic_get_error']]
#JAGetError.argtypes = [ctypes.c_void_p]
JAGetError.argtypes = [POINTER(POINTER(ctypes.c_char))]
JAGetError.restype = ctypes.c_int

"""
void jtagatlantic_close (JTAGATLANTIC * link);
"""
JAClose = libjtag_atlantic[mangle_table['jtagatlantic_close']]
JAClose.argtypes = [ctypes.c_void_p]
JAClose.restype = None

"""
int  jtagatlantic_write (JTAGATLANTIC * link, const char * data, unsigned int count);
"""
JAWrite = libjtag_atlantic[mangle_table['jtagatlantic_write']]
JAWrite.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_uint]
JAWrite.restype = ctypes.c_int

"""
int  jtagatlantic_flush (JTAGATLANTIC * link);
"""
JAFlush = libjtag_atlantic[mangle_table['jtagatlantic_flush']]
JAFlush.argtypes = [ctypes.c_void_p]
JAFlush.restype = ctypes.c_int

"""
int  jtagatlantic_read (JTAGATLANTIC * link, char * buffer, unsigned int buffsize);
"""
JARead = libjtag_atlantic[mangle_table['jtagatlantic_read']]
JARead.argtypes = [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_uint]
JARead.restype = ctypes.c_int


class JtagUart:

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

    def __init__(self, cable = None, device_nr = -1, instance_nr = -1, exe_name = None):

        self.exe_name   = exe_name
        
        self.handle     = JAOpen(
                            ctypes.c_char_p(cable), 
                            ctypes.c_int(device_nr), 
                            ctypes.c_int(instance_nr), 
                            ctypes.c_char_p(exe_name)
                        )

    def get_error_nr(self):
        other_info = POINTER(c_char)()
        err = JAGetError(byref(other_info))
        print(other_info[0])
        print(err)

        return err

    def get_error_msg(self):
        err = self.get_error_nr()
        print(err)
        if err >= -9 and err <= 0:
            return JtagUart.ERROR_MSGS[-err]

        return None

ju = JtagUart()

print(ju.handle)
print(ju.get_error_msg())


