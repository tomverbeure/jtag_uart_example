#! /usr/bin/env python3

import sys, platform
import ctypes, ctypes.util
import os.path

from ctypes import POINTER

if platform.uname().system == "Windows":
    system                    = "Windows"
    libjtag_client_filename   = 'jtag_client.dll'
    libjtag_atlantic_filename = 'jtag_atlantic.dll'
    bin_dir                   = 'bin64'
elif platform.uname().system == "Linux":
    system                    = "Linux"
    libjtag_client_filename   = 'libjtag_client.so'
    libjtag_atlantic_filename = 'libjtag_atlantic.so'
    bin_dir                   = 'linux64'

def load_shared_library(lib_filename):
    try:
        # https://stackoverflow.com/questions/2327344/ctypes-loading-a-c-shared-library-that-has-dependencies
        # Use RTLD_GLOBAL to load the libjtag_client symbols into a global symbol space.
        # If you don't do this, then libjtag_atlantic can't find symbols from libjtag_client.

        # Look in the directory where this file is located
        prefix = os.path.dirname(os.path.realpath(__file__)) + os.path.sep
        lib = ctypes.CDLL(prefix + os.path.sep + lib_filename, mode=ctypes.RTLD_GLOBAL)
        return lib
    
    except Exception as e:
    
        try: 
            # Look in the directory of the executable
            prefix = "." + os.path.sep
            lib = ctypes.CDLL(prefix + lib_filename, mode=ctypes.RTLD_GLOBAL)
            return lib
    
        except Exception as e:

            try: 
                # General OS search (e.g. LD_LIBRARY_PATH)
                lib = ctypes.CDLL(lib_filename, mode=ctypes.RTLD_GLOBAL)
                return lib

            except Exception as e:

                try:
                    # Look in $QUARTUS_ROOTDIR
                    prefix = os.environ['QUARTUS_ROOTDIR'] + os.path.sep + bin_dir + os.path.sep
                    lib = ctypes.CDLL(prefix + lib_filename, mode=ctypes.RTLD_GLOBAL)
                    return lib

                except Exception as e:
                    print(e)
                    sys.exit(0)

libjtag_client   = load_shared_library(libjtag_client_filename)
libjtag_atlantic = load_shared_library(libjtag_atlantic_filename)

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
            'Linux'         : '_Z17jtagatlantic_openPKciiS0_',
            'Windows'       : '?jtagatlantic_open@@YAPEAUJTAGATLANTIC@@PEBDHH0@Z',
            'argtypes'      : [ctypes.c_char_p, ctypes.c_int, ctypes.c_int, ctypes.c_char_p],
            'restype'       : ctypes.c_void_p,
        },
        'jtagatlantic_read'             : { 
            'Linux'         : '_Z17jtagatlantic_readP12JTAGATLANTICPcj',
            'Windows'       : '?jtagatlantic_read@@YAHPEAUJTAGATLANTIC@@PEADI@Z',
            'argtypes'      : [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_uint],
            'restype'       : ctypes.c_int
        },
        'jtagatlantic_close'            : { 
            'Linux'         : '_Z18jtagatlantic_closeP12JTAGATLANTIC',
            'Windows'       : '?jtagatlantic_close@@YAXPEAUJTAGATLANTIC@@@Z',
            'argtypes'      :  [ctypes.c_void_p],
            'restype'       :  None
        },
        'jtagatlantic_flush'            : { 
            'Linux'         : '_Z18jtagatlantic_flushP12JTAGATLANTIC',
            'Windows'       : '?jtagatlantic_flush@@YAHPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       :  None
        },
        'jtagatlantic_write'            : { 
            'Linux'         : '_Z18jtagatlantic_writeP12JTAGATLANTICPKcj',
            'Windows'       : '?jtagatlantic_write@@YAHPEAUJTAGATLANTIC@@PEBDI@Z',
            'argtypes'      : [ctypes.c_void_p, ctypes.c_char_p, ctypes.c_uint],
            'restype'       : ctypes.c_int
        },
        'jtagatlantic_get_info'         : { 
            'Linux'         : '_Z21jtagatlantic_get_infoP12JTAGATLANTICPPKcPiS4_',
            'Windows'       : '?jtagatlantic_get_info@@YAXPEAUJTAGATLANTIC@@PEAPEBDPEAH2@Z',
            'argtypes'      : [ ctypes.c_void_p, POINTER(ctypes.c_char_p), POINTER(ctypes.c_int), POINTER(ctypes.c_int) ],
            'restype'       : None,
        },
        'jtagatlantic_get_error'        : { 
            'Linux'         : '_Z22jtagatlantic_get_errorPPKc',
            'Windows'       : '?jtagatlantic_get_error@@YA?AW4JATL_ERROR@@PEAPEBD@Z',
            'argtypes'      : [POINTER(ctypes.c_char_p)], 
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_wait_open'        : { 
            'Linux'         : '_Z22jtagatlantic_wait_openP12JTAGATLANTIC',
            'Windows'       : '?jtagatlantic_wait_open@@YAHPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_scan_thread'      : { 
            'Linux'         : '_Z24jtagatlantic_scan_threadP12JTAGATLANTIC',
            'Windows'       : '?jtagatlantic_scan_thread@@YAXPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_cable_warning'    : { 
            'Linux'         : '_Z26jtagatlantic_cable_warningP12JTAGATLANTIC',
            'Windows'       : '?jtagatlantic_cable_warning@@YAHPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_is_setup_done'    : { 
            'Linux'         : '_Z26jtagatlantic_is_setup_doneP12JTAGATLANTIC',
            'Windows'       : '?jtagatlantic_is_setup_done@@YA_NPEAUJTAGATLANTIC@@@Z',
            'argtypes'      : [ctypes.c_void_p],
            'restype'       : ctypes.c_int,
        },
        'jtagatlantic_bytes_available'  : { 
            'Linux'         : '_Z28jtagatlantic_bytes_availableP12JTAGATLANTIC',
            'Windows'       : '?jtagatlantic_bytes_available@@YAHPEAUJTAGATLANTIC@@@Z',
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

            func_ptr            = libjtag_atlantic[func_info[system]]
            func_ptr.argtypes   = func_info['argtypes']
            func_ptr.restype    = func_info['restype']
            func_info['ptr']    = func_ptr


    def __init__(self, cable_name = None, device_nr = -1, instance_nr = -1, exe_name = None):

        self.exe_name   = exe_name

        if cable_name is None:
            cable_name_b    = None
        elif type(cable_name) == str:
            cable_name_b    = bytes(cable_name, 'utf-8')
        elif type(cable_name) == bytes:
            cable_name_b    = cable_name
        else:
            raise Exception

        self.handle = self.open(cable_name_b, device_nr, instance_nr, exe_name)
        if self.handle is None:
            err_str = self.get_error_msg()
            raise Exception(err_str)

    def open(self, cable_name, device_nr, instance_nr, exe_name):

        handle = intel_jtag_uart.function_table['jtagatlantic_open']['ptr'](
                        ctypes.c_char_p(cable_name), 
                        ctypes.c_int(device_nr), 
                        ctypes.c_int(instance_nr), 
                        ctypes.c_char_p(exe_name)
                        )

        return handle

    def close(self):
        intel_jtag_uart.function_table['jtagatlantic_close']['ptr'](
                            self.handle
                        )

    def get_error_nr(self):
        other_info = ctypes.c_char_p()
        err = intel_jtag_uart.function_table['jtagatlantic_get_error']['ptr'](ctypes.byref(other_info))

        return err

    def get_error_msg(self):
        err = self.get_error_nr()
        if err >= -9 and err <= 0:
            return intel_jtag_uart.ERROR_MSGS[-err]

        return None

    def get_info(self):
        cable_name  = ctypes.c_char_p()
        device_nr   = ctypes.c_int()
        instance_nr = ctypes.c_int()

        intel_jtag_uart.function_table['jtagatlantic_get_info']['ptr'](
                            self.handle,
                            ctypes.byref(cable_name),
                            ctypes.byref(device_nr),
                            ctypes.byref(instance_nr)
                        )

        return [cable_name.value.decode("utf-8"), device_nr.value, instance_nr.value ]

    def write(self, data_bytes, flush = True):
        bytes_written = intel_jtag_uart.function_table['jtagatlantic_write']['ptr'](
                            self.handle,
                            ctypes.c_char_p(data_bytes),
                            ctypes.c_uint(len(data_bytes))
                        )

        if bytes_written == -1:
            raise Exception("Connection broken")

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

        if bytes_read == -1:
            raise Exception("Connection broken")

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
        return status != 0

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

