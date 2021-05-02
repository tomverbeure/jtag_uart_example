
# FPGA Quick RAM Update Example

This project contains a simple design with a VexRiscv CPU, a bit
of RAM, a control register to set the value of 3 LEDs and a status
register to read back the value of a button.

It's an example design that goes with my 
[A Hack to Update RAM Initialization Contents in Intel FPGA Bitstreams](https://tomverbeure.github.io/2021/04/25/Intel-FPGA-RAM-Bitstream-Patching.html)
blog post.

## Contents

* `./rtl`: RTL files 

    The Verilog of the `VexRiscv.v` file was generated from a SpinalHDL 
    (which is not included in the project.)

* `./sw`: firmware for the CPU system 

    A small C project that toggles 3 LEDs in sequence. When a button in 
    pressed, the LEDs toggle at double the speed.

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

    The method of updating the RAM has been confirmed to work for Quartus
    13.0sp1 (the last version that supports Cyclone II devices), Quartus
    17, Quartus 18, Quartus 19 and Quartus 20.

* `./misc`

    Contains helps scripts. In this case, the `create_mif.rb` script which converts
    binary files into MIF file (and other formats as well...)

## Required software

* Intel Quartus  
* RISC-V GCC toolchain to compile a firmware image

    Precompiled binaries can be downloaded [here](https://github.com/sifive/freedom-tools/releases).

* Icarus Verilog Simulator

    On Ubuntu: `sudo apt install iverilog`

* GTKWave Waveform viewer

    On Ubuntu: `sudo apt install gtkwave`

## License

See LICENSE. Use this anyway you want, except for `./rtl/VexRiscv.v`, which is released
under [the MIT license](https://github.com/SpinalHDL/VexRiscv/blob/master/LICENSE).

