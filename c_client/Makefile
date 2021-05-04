QUARTUS_ROOTDIR 	?= ~/intelLite/20.1/quartus
QUARTUS_LINUX64		= $(QUARTUS_ROOTDIR)/linux64

#LDFLAGS=-L. -Wl,-rpath=. -L$(QUARTUS_LINUX64)
LDFLAGS=-L$(QUARTUS_LINUX64)
LDLIBS=-ljtag_atlantic -ljtag_client

#CXX=g++
#CC=$(CXX)
#CXXFLAGS=-O2 -Wall

all: reverse_led_sequence

reverse_led_sequence: reverse_led_sequence.o common.o

clean:
	rm -f reverse_led_sequence *.o 

shared_lib_dump:
	nm $(QUARTUS_LINUX64)/libjtag_atlantic.so | c++filt

