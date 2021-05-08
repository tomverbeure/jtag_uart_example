
# Intel FPGA JTAG UART Example 

This project contains a simple design with a VexRiscv CPU, a bit
of RAM, a control register to set the value of 3 LEDs and a status
register to read back the value of a button, and a JTAG UART.

It's an example design that goes with my 
[The Intel JTAG UART - Add a Serial Console to Your Design without Extra IO Pins](https://tomverbeure.github.io/2021/05/02/Intel-JTAG-UART.html)
and
[Write Your Own C and Python Clients for the Intel JTAG UART](https://tomverbeure.github.io/2021/05/08/Write-Your-Own-C-and-Python-Clients-for-Intel-JTAG-UART-with-libjtag_atlantic.html)
blog posts.

## Contents

* `./rtl`: RTL files 

    The Verilog of the `VexRiscv.v` file was generated from a SpinalHDL 
    (which is not included in the project.)

* `./sw`: firmware for the CPU system 

    A small C project that toggles 3 LEDs in sequence. When a button in 
    pressed, the LEDs toggle at double the speed.

    When the design is loaded into an FPGA, doing `nios2-terminal` will print
    a "Hello World!" message, and pressing 'r' will reverse the order in which
    LEDs are toggled.

    Do `make` to create a firmware image.

* `./tb`: Testbench

    To verify that the design works in simulation.

    Do `make` to simulate.

* `./quartus_max10_deca`: Quartus project for an Arrow DECA FPGA board

    In addition to all the standard files that are needed for 
    a Quartus project, the `./quartus_max10_deca` directory also contains
    a makefile to compile the design from the command line. 

    Do `make` to compile the whole design from scratch.

    Do `make update_ram` to only update the RAM contains of an already built 
    bitstream.

    This makefile can trivially be adapted for projects that use different
    versions of Quartus, and for different designs.

* `./misc`

    Contains helps scripts. In this case, the `create_mif.rb` script which converts
    binary files into MIF file (and other formats as well...)

* [`./c_client`](./c_client)

    Shows how to use Intel's `jtag_atlantic` shared library to create your own
    JTAG UART clients in C. 

* `./py_client`

    Uses my [`intel-jtag-uart`](https://pypi.org/project/intel-jtag-uart/) package to create
    a JTAG UART client in Python.

## Required software

* Intel Quartus  

    Make sure that the Nios2 SDK is installed, because you need `nios2-terminal` to
    connected to the JTAG UART.

* RISC-V GCC toolchain to compile a firmware image

    Precompiled binaries can be downloaded [here](https://github.com/sifive/freedom-tools/releases).

* Icarus Verilog Simulator

    On Ubuntu: `sudo apt install iverilog`

* GTKWave Waveform viewer

    On Ubuntu: `sudo apt install gtkwave`

## License

See LICENSE. Use this anyway you want, except for: 

* `./rtl/VexRiscv.v`, which is released under [the MIT license](https://github.com/SpinalHDL/VexRiscv/blob/master/LICENSE).
* `./c_client`, also released under the MIT license.
* `./py_client`,also released under the MIT license.


