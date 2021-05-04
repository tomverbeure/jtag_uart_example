QUARTUS_ROOTDIR  	?= ~/intelLite/20.1/quartus
QUARTUS_LINUX64     = $(QUARTUS_ROOTDIR)/linux64

LDFLAGS             =-L. -Wl,-rpath=.
LDFLAGS             +=-L$(QUARTUS_LINUX64)
LDLIBS              +=-ljtag_atlantic -ljtag_client

#CXX=g++
#CC=$(CXX)
#CXXFLAGS=-O2 -Wall

all: jtag_uart_send_cmd run

run:
	LD_LIBRARY_PATH=$(QUARTUS_LINUX64) ./jtag_uart_send_cmd hr

jtag_uart_send_cmd: jtag_uart_send_cmd.o common.o

clean:
	rm -f jtag_uart_send_cmd *.o 

shared_lib_dump:
	nm $(QUARTUS_LINUX64)/libjtag_atlantic.so | c++filt

