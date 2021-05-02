// Generator : SpinalHDL v1.4.4    git head : 24f37223890054708116118aba3dc8e8af944ef0
// Component : VexRiscv
// Git hash  : 755478f93a8201698566841c7e8e3b557c6a2dcf


`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_EBREAK 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11

module VexRiscvTop(
  output              io_iBus_cmd_valid,
  input               io_iBus_cmd_ready,
  output     [31:0]   io_iBus_cmd_payload_pc,
  input               io_iBus_rsp_valid,
  input               io_iBus_rsp_payload_error,
  input      [31:0]   io_iBus_rsp_payload_inst,
  output              io_dBus_cmd_valid,
  input               io_dBus_cmd_ready,
  output              io_dBus_cmd_payload_wr,
  output     [31:0]   io_dBus_cmd_payload_address,
  output     [31:0]   io_dBus_cmd_payload_data,
  output     [1:0]    io_dBus_cmd_payload_size,
  input               io_dBus_rsp_ready,
  input               io_dBus_rsp_error,
  input      [31:0]   io_dBus_rsp_data,
  input               io_timerInterrupt,
  input               io_externalInterrupt,
  input               clk,
  input               reset
);
  wire                _zz_VexRiscvWithDebug_2;
  wire       [7:0]    _zz_VexRiscvWithDebug_3;
  wire                _zz_VexRiscvWithDebug_4;
  wire                _zz_VexRiscvWithDebug_5;
  wire                cpu_iBus_cmd_valid;
  wire       [31:0]   cpu_iBus_cmd_payload_pc;
  wire                cpu_debug_bus_cmd_ready;
  wire       [31:0]   cpu_debug_bus_rsp_data;
  wire                cpu_debug_resetOut;
  wire                cpu_dBus_cmd_valid;
  wire                cpu_dBus_cmd_payload_wr;
  wire       [31:0]   cpu_dBus_cmd_payload_address;
  wire       [31:0]   cpu_dBus_cmd_payload_data;
  wire       [1:0]    cpu_dBus_cmd_payload_size;
  wire                vJTAG_1_virtual_state_cdr;
  wire                vJTAG_1_virtual_state_sdr;
  wire                vJTAG_1_tck;
  wire                vJTAG_1_tdi;
  wire                vJTAG_1_virtual_state_udr;
  wire                jtagBridgeNoTap_1_io_ctrl_tdo;
  wire                jtagBridgeNoTap_1_io_remote_cmd_valid;
  wire                jtagBridgeNoTap_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridgeNoTap_1_io_remote_cmd_payload_fragment;
  wire                jtagBridgeNoTap_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  reg                 _zz_VexRiscvWithDebug_1;

  VexRiscv cpu (
    .iBus_cmd_valid                   (cpu_iBus_cmd_valid                              ), //o
    .iBus_cmd_ready                   (io_iBus_cmd_ready                               ), //i
    .iBus_cmd_payload_pc              (cpu_iBus_cmd_payload_pc[31:0]                   ), //o
    .iBus_rsp_valid                   (io_iBus_rsp_valid                               ), //i
    .iBus_rsp_payload_error           (io_iBus_rsp_payload_error                       ), //i
    .iBus_rsp_payload_inst            (io_iBus_rsp_payload_inst[31:0]                  ), //i
    .timerInterrupt                   (io_timerInterrupt                               ), //i
    .externalInterrupt                (io_externalInterrupt                            ), //i
    .softwareInterrupt                (_zz_VexRiscvWithDebug_2                         ), //i
    .debug_bus_cmd_valid              (systemDebugger_1_io_mem_cmd_valid               ), //i
    .debug_bus_cmd_ready              (cpu_debug_bus_cmd_ready                         ), //o
    .debug_bus_cmd_payload_wr         (systemDebugger_1_io_mem_cmd_payload_wr          ), //i
    .debug_bus_cmd_payload_address    (_zz_VexRiscvWithDebug_3[7:0]                    ), //i
    .debug_bus_cmd_payload_data       (systemDebugger_1_io_mem_cmd_payload_data[31:0]  ), //i
    .debug_bus_rsp_data               (cpu_debug_bus_rsp_data[31:0]                    ), //o
    .debug_resetOut                   (cpu_debug_resetOut                              ), //o
    .dBus_cmd_valid                   (cpu_dBus_cmd_valid                              ), //o
    .dBus_cmd_ready                   (io_dBus_cmd_ready                               ), //i
    .dBus_cmd_payload_wr              (cpu_dBus_cmd_payload_wr                         ), //o
    .dBus_cmd_payload_address         (cpu_dBus_cmd_payload_address[31:0]              ), //o
    .dBus_cmd_payload_data            (cpu_dBus_cmd_payload_data[31:0]                 ), //o
    .dBus_cmd_payload_size            (cpu_dBus_cmd_payload_size[1:0]                  ), //o
    .dBus_rsp_ready                   (io_dBus_rsp_ready                               ), //i
    .dBus_rsp_error                   (io_dBus_rsp_error                               ), //i
    .dBus_rsp_data                    (io_dBus_rsp_data[31:0]                          ), //i
    .clk                              (clk                                             ), //i
    .reset                            (reset                                           )  //i
  );

  assign vJTAG_1_virtual_state_cdr    = 1'b0;
  assign vJTAG_1_virtual_state_sdr    = 1'b0;
  assign vJTAG_1_tck                  = 1'b0;
  assign vJTAG_1_tdi                  = 1'b0;
  assign vJTAG_1_virtual_state_udr    = 1'b0;

  JtagBridgeNoTap jtagBridgeNoTap_1 (
    .io_ctrl_tdi                       (vJTAG_1_tdi                                        ), //i
    .io_ctrl_enable                    (_zz_VexRiscvWithDebug_4                            ), //i
    .io_ctrl_capture                   (vJTAG_1_virtual_state_cdr                          ), //i
    .io_ctrl_shift                     (vJTAG_1_virtual_state_sdr                          ), //i
    .io_ctrl_update                    (vJTAG_1_virtual_state_udr                          ), //i
    .io_ctrl_reset                     (_zz_VexRiscvWithDebug_5                            ), //i
    .io_ctrl_tdo                       (jtagBridgeNoTap_1_io_ctrl_tdo                      ), //o
    .io_remote_cmd_valid               (jtagBridgeNoTap_1_io_remote_cmd_valid              ), //o
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //i
    .io_remote_cmd_payload_last        (jtagBridgeNoTap_1_io_remote_cmd_payload_last       ), //o
    .io_remote_cmd_payload_fragment    (jtagBridgeNoTap_1_io_remote_cmd_payload_fragment   ), //o
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //i
    .io_remote_rsp_ready               (jtagBridgeNoTap_1_io_remote_rsp_ready              ), //o
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //i
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //i
    .clk                               (clk                                                ), //i
    .reset                             (reset                                              ), //i
    .tck                               (vJTAG_1_tck                                        )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid               (jtagBridgeNoTap_1_io_remote_cmd_valid              ), //i
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //o
    .io_remote_cmd_payload_last        (jtagBridgeNoTap_1_io_remote_cmd_payload_last       ), //i
    .io_remote_cmd_payload_fragment    (jtagBridgeNoTap_1_io_remote_cmd_payload_fragment   ), //i
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //o
    .io_remote_rsp_ready               (jtagBridgeNoTap_1_io_remote_rsp_ready              ), //i
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //o
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //o
    .io_mem_cmd_valid                  (systemDebugger_1_io_mem_cmd_valid                  ), //o
    .io_mem_cmd_ready                  (cpu_debug_bus_cmd_ready                            ), //i
    .io_mem_cmd_payload_address        (systemDebugger_1_io_mem_cmd_payload_address[31:0]  ), //o
    .io_mem_cmd_payload_data           (systemDebugger_1_io_mem_cmd_payload_data[31:0]     ), //o
    .io_mem_cmd_payload_wr             (systemDebugger_1_io_mem_cmd_payload_wr             ), //o
    .io_mem_cmd_payload_size           (systemDebugger_1_io_mem_cmd_payload_size[1:0]      ), //o
    .io_mem_rsp_valid                  (_zz_VexRiscvWithDebug_1                            ), //i
    .io_mem_rsp_payload                (cpu_debug_bus_rsp_data[31:0]                       ), //i
    .clk                               (clk                                                ), //i
    .reset                             (reset                                              )  //i
  );
  assign io_iBus_cmd_valid = cpu_iBus_cmd_valid;
  assign io_iBus_cmd_payload_pc = cpu_iBus_cmd_payload_pc;
  assign io_dBus_cmd_valid = cpu_dBus_cmd_valid;
  assign io_dBus_cmd_payload_wr = cpu_dBus_cmd_payload_wr;
  assign io_dBus_cmd_payload_address = cpu_dBus_cmd_payload_address;
  assign io_dBus_cmd_payload_data = cpu_dBus_cmd_payload_data;
  assign io_dBus_cmd_payload_size = cpu_dBus_cmd_payload_size;
  assign _zz_VexRiscvWithDebug_4 = 1'b1;
  assign _zz_VexRiscvWithDebug_5 = 1'b0;
  assign _zz_VexRiscvWithDebug_3 = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign _zz_VexRiscvWithDebug_2 = 1'b0;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      _zz_VexRiscvWithDebug_1 <= 1'b0;
    end else begin
      _zz_VexRiscvWithDebug_1 <= (systemDebugger_1_io_mem_cmd_valid && cpu_debug_bus_cmd_ready);
    end
  end


endmodule

module SystemDebugger (
  input               io_remote_cmd_valid,
  output              io_remote_cmd_ready,
  input               io_remote_cmd_payload_last,
  input      [0:0]    io_remote_cmd_payload_fragment,
  output              io_remote_rsp_valid,
  input               io_remote_rsp_ready,
  output              io_remote_rsp_payload_error,
  output     [31:0]   io_remote_rsp_payload_data,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output              io_mem_cmd_payload_wr,
  output     [1:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload,
  input               clk,
  input               reset
);
  wire                _zz_SystemDebugger_2;
  wire       [0:0]    _zz_SystemDebugger_3;
  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire       [66:0]   _zz_SystemDebugger_1;

  assign _zz_SystemDebugger_2 = (dispatcher_headerLoaded == 1'b0);
  assign _zz_SystemDebugger_3 = _zz_SystemDebugger_1[64 : 64];
  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_SystemDebugger_1 = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_SystemDebugger_1[31 : 0];
  assign io_mem_cmd_payload_data = _zz_SystemDebugger_1[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_SystemDebugger_3[0];
  assign io_mem_cmd_payload_size = _zz_SystemDebugger_1[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid)begin
        if(_zz_SystemDebugger_2)begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if((dispatcher_counter == 3'b111))begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last)begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! (io_mem_cmd_valid && (! io_mem_cmd_ready)))))begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(io_remote_cmd_valid)begin
      if(_zz_SystemDebugger_2)begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1);
      end
    end
  end


endmodule

module JtagBridgeNoTap (
  input               io_ctrl_tdi,
  input               io_ctrl_enable,
  input               io_ctrl_capture,
  input               io_ctrl_shift,
  input               io_ctrl_update,
  input               io_ctrl_reset,
  output              io_ctrl_tdo,
  output              io_remote_cmd_valid,
  input               io_remote_cmd_ready,
  output              io_remote_cmd_payload_last,
  output     [0:0]    io_remote_cmd_payload_fragment,
  input               io_remote_rsp_valid,
  output              io_remote_rsp_ready,
  input               io_remote_rsp_payload_error,
  input      [31:0]   io_remote_rsp_payload_data,
  input               clk,
  input               reset,
  input               tck
);
  wire                _zz_JtagBridgeNoTap_9;
  wire                flowCCByToggle_1_io_output_valid;
  wire                flowCCByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1_io_output_payload_fragment;
  wire                _zz_JtagBridgeNoTap_10;
  wire                _zz_JtagBridgeNoTap_11;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                jtag_wrapper_ctrl_tdi;
  wire                jtag_wrapper_ctrl_enable;
  wire                jtag_wrapper_ctrl_capture;
  wire                jtag_wrapper_ctrl_shift;
  wire                jtag_wrapper_ctrl_update;
  wire                jtag_wrapper_ctrl_reset;
  reg                 jtag_wrapper_ctrl_tdo;
  reg        [1:0]    jtag_wrapper_header;
  wire       [1:0]    jtag_wrapper_headerNext;
  reg        [0:0]    jtag_wrapper_counter;
  reg                 jtag_wrapper_done;
  reg                 jtag_wrapper_sendCapture;
  reg                 jtag_wrapper_sendShift;
  reg                 jtag_wrapper_sendUpdate;
  wire                _zz_JtagBridgeNoTap_1;
  wire                _zz_JtagBridgeNoTap_2;
  wire       [0:0]    _zz_JtagBridgeNoTap_3;
  reg                 _zz_JtagBridgeNoTap_4;
  reg                 _zz_JtagBridgeNoTap_5;
  wire                _zz_JtagBridgeNoTap_6;
  reg        [33:0]   _zz_JtagBridgeNoTap_7;
  wire                _zz_JtagBridgeNoTap_8;

  assign _zz_JtagBridgeNoTap_10 = (! jtag_wrapper_done);
  assign _zz_JtagBridgeNoTap_11 = (jtag_wrapper_counter == 1'b1);
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid                (_zz_JtagBridgeNoTap_4                        ), //i
    .io_input_payload_last         (_zz_JtagBridgeNoTap_9                        ), //i
    .io_input_payload_fragment     (_zz_JtagBridgeNoTap_3                        ), //i
    .io_output_valid               (flowCCByToggle_1_io_output_valid             ), //o
    .io_output_payload_last        (flowCCByToggle_1_io_output_payload_last      ), //o
    .io_output_payload_fragment    (flowCCByToggle_1_io_output_payload_fragment  ), //o
    .tck                           (tck                                          ), //i
    .clk                           (clk                                          ), //i
    .reset                         (reset                                        )  //i
  );
  assign io_remote_cmd_valid = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_rsp_ready = 1'b1;
  assign jtag_wrapper_headerNext = ({jtag_wrapper_ctrl_tdi,jtag_wrapper_header} >>> 1);
  always @ (*) begin
    jtag_wrapper_sendCapture = 1'b0;
    if(jtag_wrapper_ctrl_enable)begin
      if(jtag_wrapper_ctrl_shift)begin
        if(_zz_JtagBridgeNoTap_10)begin
          if(_zz_JtagBridgeNoTap_11)begin
            jtag_wrapper_sendCapture = 1'b1;
          end
        end
      end
    end
  end

  always @ (*) begin
    jtag_wrapper_sendShift = 1'b0;
    if(jtag_wrapper_ctrl_enable)begin
      if(jtag_wrapper_ctrl_shift)begin
        if(! _zz_JtagBridgeNoTap_10) begin
          jtag_wrapper_sendShift = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    jtag_wrapper_sendUpdate = 1'b0;
    if(jtag_wrapper_ctrl_enable)begin
      if(jtag_wrapper_ctrl_update)begin
        jtag_wrapper_sendUpdate = 1'b1;
      end
    end
  end

  always @ (*) begin
    jtag_wrapper_ctrl_tdo = 1'b0;
    if(_zz_JtagBridgeNoTap_6)begin
      jtag_wrapper_ctrl_tdo = 1'b0;
    end
    if(_zz_JtagBridgeNoTap_8)begin
      jtag_wrapper_ctrl_tdo = _zz_JtagBridgeNoTap_7[0];
    end
  end

  assign jtag_wrapper_ctrl_tdi = io_ctrl_tdi;
  assign jtag_wrapper_ctrl_enable = io_ctrl_enable;
  assign jtag_wrapper_ctrl_capture = io_ctrl_capture;
  assign jtag_wrapper_ctrl_shift = io_ctrl_shift;
  assign jtag_wrapper_ctrl_update = io_ctrl_update;
  assign jtag_wrapper_ctrl_reset = io_ctrl_reset;
  assign io_ctrl_tdo = jtag_wrapper_ctrl_tdo;
  assign _zz_JtagBridgeNoTap_3[0] = _zz_JtagBridgeNoTap_5;
  assign _zz_JtagBridgeNoTap_9 = (! (_zz_JtagBridgeNoTap_1 && _zz_JtagBridgeNoTap_2));
  assign system_cmd_valid = flowCCByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1_io_output_payload_fragment;
  assign _zz_JtagBridgeNoTap_6 = (jtag_wrapper_header == 2'b00);
  assign _zz_JtagBridgeNoTap_1 = 1'b1;
  assign _zz_JtagBridgeNoTap_2 = (_zz_JtagBridgeNoTap_6 && jtag_wrapper_sendShift);
  assign _zz_JtagBridgeNoTap_8 = (jtag_wrapper_header == 2'b01);
  always @ (posedge clk) begin
    if(io_remote_cmd_valid)begin
      system_rsp_valid <= 1'b0;
    end
    if((io_remote_rsp_valid && io_remote_rsp_ready))begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @ (posedge tck) begin
    if(jtag_wrapper_ctrl_enable)begin
      if(jtag_wrapper_ctrl_capture)begin
        jtag_wrapper_done <= 1'b0;
        jtag_wrapper_counter <= 1'b0;
      end
      if(jtag_wrapper_ctrl_shift)begin
        if(_zz_JtagBridgeNoTap_10)begin
          jtag_wrapper_counter <= (jtag_wrapper_counter + 1'b1);
          jtag_wrapper_header <= jtag_wrapper_headerNext;
          if(_zz_JtagBridgeNoTap_11)begin
            jtag_wrapper_done <= 1'b1;
          end
        end
      end
    end
    _zz_JtagBridgeNoTap_4 <= (_zz_JtagBridgeNoTap_1 && _zz_JtagBridgeNoTap_2);
    _zz_JtagBridgeNoTap_5 <= jtag_wrapper_ctrl_tdi;
    if(1'b1)begin
      if(((jtag_wrapper_headerNext == 2'b01) && jtag_wrapper_sendCapture))begin
        _zz_JtagBridgeNoTap_7 <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if((_zz_JtagBridgeNoTap_8 && jtag_wrapper_sendShift))begin
        _zz_JtagBridgeNoTap_7 <= ({jtag_wrapper_ctrl_tdi,_zz_JtagBridgeNoTap_7} >>> 1);
      end
    end
  end


endmodule

module VexRiscv (
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  input               debug_bus_cmd_valid,
  output reg          debug_bus_cmd_ready,
  input               debug_bus_cmd_payload_wr,
  input      [7:0]    debug_bus_cmd_payload_address,
  input      [31:0]   debug_bus_cmd_payload_data,
  output reg [31:0]   debug_bus_rsp_data,
  output              debug_resetOut,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               clk,
  input               reset
);
  wire                _zz_VexRiscv_145;
  wire                _zz_VexRiscv_146;
  reg        [31:0]   _zz_VexRiscv_147;
  reg        [31:0]   _zz_VexRiscv_148;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_VexRiscv_149;
  wire                _zz_VexRiscv_150;
  wire                _zz_VexRiscv_151;
  wire                _zz_VexRiscv_152;
  wire                _zz_VexRiscv_153;
  wire                _zz_VexRiscv_154;
  wire                _zz_VexRiscv_155;
  wire                _zz_VexRiscv_156;
  wire                _zz_VexRiscv_157;
  wire                _zz_VexRiscv_158;
  wire                _zz_VexRiscv_159;
  wire       [1:0]    _zz_VexRiscv_160;
  wire                _zz_VexRiscv_161;
  wire                _zz_VexRiscv_162;
  wire                _zz_VexRiscv_163;
  wire                _zz_VexRiscv_164;
  wire                _zz_VexRiscv_165;
  wire                _zz_VexRiscv_166;
  wire                _zz_VexRiscv_167;
  wire                _zz_VexRiscv_168;
  wire                _zz_VexRiscv_169;
  wire       [5:0]    _zz_VexRiscv_170;
  wire                _zz_VexRiscv_171;
  wire                _zz_VexRiscv_172;
  wire                _zz_VexRiscv_173;
  wire                _zz_VexRiscv_174;
  wire                _zz_VexRiscv_175;
  wire                _zz_VexRiscv_176;
  wire       [4:0]    _zz_VexRiscv_177;
  wire       [1:0]    _zz_VexRiscv_178;
  wire       [1:0]    _zz_VexRiscv_179;
  wire       [1:0]    _zz_VexRiscv_180;
  wire                _zz_VexRiscv_181;
  wire       [0:0]    _zz_VexRiscv_182;
  wire       [0:0]    _zz_VexRiscv_183;
  wire       [0:0]    _zz_VexRiscv_184;
  wire       [0:0]    _zz_VexRiscv_185;
  wire       [0:0]    _zz_VexRiscv_186;
  wire       [0:0]    _zz_VexRiscv_187;
  wire       [2:0]    _zz_VexRiscv_188;
  wire       [31:0]   _zz_VexRiscv_189;
  wire       [0:0]    _zz_VexRiscv_190;
  wire       [0:0]    _zz_VexRiscv_191;
  wire       [0:0]    _zz_VexRiscv_192;
  wire       [0:0]    _zz_VexRiscv_193;
  wire       [0:0]    _zz_VexRiscv_194;
  wire       [0:0]    _zz_VexRiscv_195;
  wire       [1:0]    _zz_VexRiscv_196;
  wire       [1:0]    _zz_VexRiscv_197;
  wire       [2:0]    _zz_VexRiscv_198;
  wire       [31:0]   _zz_VexRiscv_199;
  wire       [2:0]    _zz_VexRiscv_200;
  wire       [31:0]   _zz_VexRiscv_201;
  wire       [31:0]   _zz_VexRiscv_202;
  wire       [11:0]   _zz_VexRiscv_203;
  wire       [11:0]   _zz_VexRiscv_204;
  wire       [2:0]    _zz_VexRiscv_205;
  wire       [0:0]    _zz_VexRiscv_206;
  wire       [2:0]    _zz_VexRiscv_207;
  wire       [0:0]    _zz_VexRiscv_208;
  wire       [2:0]    _zz_VexRiscv_209;
  wire       [0:0]    _zz_VexRiscv_210;
  wire       [2:0]    _zz_VexRiscv_211;
  wire       [0:0]    _zz_VexRiscv_212;
  wire       [2:0]    _zz_VexRiscv_213;
  wire       [0:0]    _zz_VexRiscv_214;
  wire       [2:0]    _zz_VexRiscv_215;
  wire       [4:0]    _zz_VexRiscv_216;
  wire       [11:0]   _zz_VexRiscv_217;
  wire       [11:0]   _zz_VexRiscv_218;
  wire       [31:0]   _zz_VexRiscv_219;
  wire       [31:0]   _zz_VexRiscv_220;
  wire       [31:0]   _zz_VexRiscv_221;
  wire       [31:0]   _zz_VexRiscv_222;
  wire       [31:0]   _zz_VexRiscv_223;
  wire       [31:0]   _zz_VexRiscv_224;
  wire       [31:0]   _zz_VexRiscv_225;
  wire       [31:0]   _zz_VexRiscv_226;
  wire       [32:0]   _zz_VexRiscv_227;
  wire       [19:0]   _zz_VexRiscv_228;
  wire       [11:0]   _zz_VexRiscv_229;
  wire       [11:0]   _zz_VexRiscv_230;
  wire       [0:0]    _zz_VexRiscv_231;
  wire       [0:0]    _zz_VexRiscv_232;
  wire       [0:0]    _zz_VexRiscv_233;
  wire       [0:0]    _zz_VexRiscv_234;
  wire       [0:0]    _zz_VexRiscv_235;
  wire       [0:0]    _zz_VexRiscv_236;
  wire                _zz_VexRiscv_237;
  wire                _zz_VexRiscv_238;
  wire                _zz_VexRiscv_239;
  wire                _zz_VexRiscv_240;
  wire       [6:0]    _zz_VexRiscv_241;
  wire       [4:0]    _zz_VexRiscv_242;
  wire                _zz_VexRiscv_243;
  wire       [4:0]    _zz_VexRiscv_244;
  wire       [31:0]   _zz_VexRiscv_245;
  wire       [31:0]   _zz_VexRiscv_246;
  wire       [31:0]   _zz_VexRiscv_247;
  wire       [31:0]   _zz_VexRiscv_248;
  wire                _zz_VexRiscv_249;
  wire       [1:0]    _zz_VexRiscv_250;
  wire       [1:0]    _zz_VexRiscv_251;
  wire                _zz_VexRiscv_252;
  wire       [0:0]    _zz_VexRiscv_253;
  wire       [20:0]   _zz_VexRiscv_254;
  wire       [31:0]   _zz_VexRiscv_255;
  wire       [31:0]   _zz_VexRiscv_256;
  wire       [31:0]   _zz_VexRiscv_257;
  wire       [31:0]   _zz_VexRiscv_258;
  wire                _zz_VexRiscv_259;
  wire                _zz_VexRiscv_260;
  wire                _zz_VexRiscv_261;
  wire       [0:0]    _zz_VexRiscv_262;
  wire       [0:0]    _zz_VexRiscv_263;
  wire                _zz_VexRiscv_264;
  wire       [0:0]    _zz_VexRiscv_265;
  wire       [17:0]   _zz_VexRiscv_266;
  wire       [31:0]   _zz_VexRiscv_267;
  wire                _zz_VexRiscv_268;
  wire                _zz_VexRiscv_269;
  wire       [0:0]    _zz_VexRiscv_270;
  wire       [0:0]    _zz_VexRiscv_271;
  wire       [0:0]    _zz_VexRiscv_272;
  wire       [0:0]    _zz_VexRiscv_273;
  wire                _zz_VexRiscv_274;
  wire       [0:0]    _zz_VexRiscv_275;
  wire       [14:0]   _zz_VexRiscv_276;
  wire       [31:0]   _zz_VexRiscv_277;
  wire       [31:0]   _zz_VexRiscv_278;
  wire       [0:0]    _zz_VexRiscv_279;
  wire       [0:0]    _zz_VexRiscv_280;
  wire       [0:0]    _zz_VexRiscv_281;
  wire       [0:0]    _zz_VexRiscv_282;
  wire                _zz_VexRiscv_283;
  wire       [0:0]    _zz_VexRiscv_284;
  wire       [11:0]   _zz_VexRiscv_285;
  wire       [31:0]   _zz_VexRiscv_286;
  wire                _zz_VexRiscv_287;
  wire                _zz_VexRiscv_288;
  wire       [0:0]    _zz_VexRiscv_289;
  wire       [0:0]    _zz_VexRiscv_290;
  wire       [0:0]    _zz_VexRiscv_291;
  wire       [0:0]    _zz_VexRiscv_292;
  wire                _zz_VexRiscv_293;
  wire       [0:0]    _zz_VexRiscv_294;
  wire       [7:0]    _zz_VexRiscv_295;
  wire       [31:0]   _zz_VexRiscv_296;
  wire       [31:0]   _zz_VexRiscv_297;
  wire       [31:0]   _zz_VexRiscv_298;
  wire       [31:0]   _zz_VexRiscv_299;
  wire       [31:0]   _zz_VexRiscv_300;
  wire       [5:0]    _zz_VexRiscv_301;
  wire       [5:0]    _zz_VexRiscv_302;
  wire                _zz_VexRiscv_303;
  wire       [0:0]    _zz_VexRiscv_304;
  wire       [4:0]    _zz_VexRiscv_305;
  wire       [31:0]   _zz_VexRiscv_306;
  wire       [31:0]   _zz_VexRiscv_307;
  wire                _zz_VexRiscv_308;
  wire       [0:0]    _zz_VexRiscv_309;
  wire       [1:0]    _zz_VexRiscv_310;
  wire       [31:0]   _zz_VexRiscv_311;
  wire       [31:0]   _zz_VexRiscv_312;
  wire                _zz_VexRiscv_313;
  wire       [0:0]    _zz_VexRiscv_314;
  wire       [2:0]    _zz_VexRiscv_315;
  wire       [0:0]    _zz_VexRiscv_316;
  wire       [0:0]    _zz_VexRiscv_317;
  wire                _zz_VexRiscv_318;
  wire       [0:0]    _zz_VexRiscv_319;
  wire       [0:0]    _zz_VexRiscv_320;
  wire       [31:0]   _zz_VexRiscv_321;
  wire                _zz_VexRiscv_322;
  wire                _zz_VexRiscv_323;
  wire       [31:0]   _zz_VexRiscv_324;
  wire       [31:0]   _zz_VexRiscv_325;
  wire       [31:0]   _zz_VexRiscv_326;
  wire                _zz_VexRiscv_327;
  wire       [0:0]    _zz_VexRiscv_328;
  wire       [0:0]    _zz_VexRiscv_329;
  wire       [31:0]   _zz_VexRiscv_330;
  wire       [31:0]   _zz_VexRiscv_331;
  wire       [0:0]    _zz_VexRiscv_332;
  wire       [1:0]    _zz_VexRiscv_333;
  wire       [1:0]    _zz_VexRiscv_334;
  wire       [1:0]    _zz_VexRiscv_335;
  wire       [1:0]    _zz_VexRiscv_336;
  wire       [1:0]    _zz_VexRiscv_337;
  wire       [31:0]   _zz_VexRiscv_338;
  wire       [31:0]   _zz_VexRiscv_339;
  wire       [31:0]   _zz_VexRiscv_340;
  wire       [31:0]   _zz_VexRiscv_341;
  wire       [31:0]   _zz_VexRiscv_342;
  wire       [31:0]   _zz_VexRiscv_343;
  wire       [31:0]   _zz_VexRiscv_344;
  wire       [31:0]   _zz_VexRiscv_345;
  wire       [31:0]   _zz_VexRiscv_346;
  wire       [31:0]   _zz_VexRiscv_347;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_1;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_2;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_3;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_4;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_5;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_6;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_7;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_8;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_9;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_10;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_11;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_12;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_13;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_14;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_15;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_16;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_17;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_18;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_19;
  wire                decode_IS_CSR;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                decode_MEMORY_ENABLE;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [31:0]   execute_RS1;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_20;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire       [31:0]   _zz_VexRiscv_21;
  wire                memory_REGFILE_WRITE_VALID;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_22;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_VexRiscv_23;
  wire       [31:0]   _zz_VexRiscv_24;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_25;
  wire       [31:0]   _zz_VexRiscv_26;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_27;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_28;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_29;
  wire       [31:0]   _zz_VexRiscv_30;
  wire                _zz_VexRiscv_31;
  reg                 _zz_VexRiscv_32;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_33;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_34;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_35;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_36;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_37;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_38;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_39;
  reg        [31:0]   _zz_VexRiscv_40;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_41;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_42;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_43;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_VexRiscv_44;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  reg        [31:0]   _zz_VexRiscv_45;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  wire                decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  reg                 IBusSimplePlugin_injectionPort_valid;
  reg                 IBusSimplePlugin_injectionPort_ready;
  wire       [31:0]   IBusSimplePlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_VexRiscv_46;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  reg                 IBusSimplePlugin_decodePc_flushed;
  reg        [31:0]   IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire       [31:0]   IBusSimplePlugin_decodePc_pcPlus;
  reg                 IBusSimplePlugin_decodePc_injectedDecode;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                _zz_VexRiscv_47;
  wire                _zz_VexRiscv_48;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_VexRiscv_49;
  wire                _zz_VexRiscv_50;
  reg                 _zz_VexRiscv_51;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_input_valid;
  wire                IBusSimplePlugin_decompressor_input_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_pc;
  wire                IBusSimplePlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_input_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_output_valid;
  wire                IBusSimplePlugin_decompressor_output_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_pc;
  wire                IBusSimplePlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_flushNext;
  wire                IBusSimplePlugin_decompressor_consumeCurrent;
  reg                 IBusSimplePlugin_decompressor_bufferValid;
  reg        [15:0]   IBusSimplePlugin_decompressor_bufferData;
  wire                IBusSimplePlugin_decompressor_isInputLowRvc;
  wire                IBusSimplePlugin_decompressor_isInputHighRvc;
  reg                 IBusSimplePlugin_decompressor_throw2BytesReg;
  wire                IBusSimplePlugin_decompressor_throw2Bytes;
  wire                IBusSimplePlugin_decompressor_unaligned;
  reg                 IBusSimplePlugin_decompressor_bufferValidLatch;
  reg                 IBusSimplePlugin_decompressor_throw2BytesLatch;
  wire                IBusSimplePlugin_decompressor_bufferValidPatched;
  wire                IBusSimplePlugin_decompressor_throw2BytesPatched;
  wire       [31:0]   IBusSimplePlugin_decompressor_raw;
  wire                IBusSimplePlugin_decompressor_isRvc;
  wire       [15:0]   _zz_VexRiscv_52;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_VexRiscv_53;
  wire       [4:0]    _zz_VexRiscv_54;
  wire       [11:0]   _zz_VexRiscv_55;
  wire                _zz_VexRiscv_56;
  reg        [11:0]   _zz_VexRiscv_57;
  wire                _zz_VexRiscv_58;
  reg        [9:0]    _zz_VexRiscv_59;
  wire       [20:0]   _zz_VexRiscv_60;
  wire                _zz_VexRiscv_61;
  reg        [14:0]   _zz_VexRiscv_62;
  wire                _zz_VexRiscv_63;
  reg        [2:0]    _zz_VexRiscv_64;
  wire                _zz_VexRiscv_65;
  reg        [9:0]    _zz_VexRiscv_66;
  wire       [20:0]   _zz_VexRiscv_67;
  wire                _zz_VexRiscv_68;
  reg        [4:0]    _zz_VexRiscv_69;
  wire       [12:0]   _zz_VexRiscv_70;
  wire       [4:0]    _zz_VexRiscv_71;
  wire       [4:0]    _zz_VexRiscv_72;
  wire       [4:0]    _zz_VexRiscv_73;
  wire                _zz_VexRiscv_74;
  reg        [2:0]    _zz_VexRiscv_75;
  reg        [2:0]    _zz_VexRiscv_76;
  wire                _zz_VexRiscv_77;
  reg        [6:0]    _zz_VexRiscv_78;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_VexRiscv_79;
  reg        [31:0]   _zz_VexRiscv_80;
  reg                 _zz_VexRiscv_81;
  reg        [31:0]   _zz_VexRiscv_82;
  reg                 _zz_VexRiscv_83;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_VexRiscv_84;
  wire                _zz_VexRiscv_85;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_VexRiscv_86;
  reg        [3:0]    _zz_VexRiscv_87;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_VexRiscv_88;
  reg        [31:0]   _zz_VexRiscv_89;
  wire                _zz_VexRiscv_90;
  reg        [31:0]   _zz_VexRiscv_91;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  wire       [1:0]    CsrPlugin_mtvec_mode;
  wire       [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_VexRiscv_92;
  wire                _zz_VexRiscv_93;
  wire                _zz_VexRiscv_94;
  wire                CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  wire                CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [26:0]   _zz_VexRiscv_95;
  wire                _zz_VexRiscv_96;
  wire                _zz_VexRiscv_97;
  wire                _zz_VexRiscv_98;
  wire                _zz_VexRiscv_99;
  wire                _zz_VexRiscv_100;
  wire                _zz_VexRiscv_101;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_VexRiscv_102;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_VexRiscv_103;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_VexRiscv_104;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_VexRiscv_105;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_VexRiscv_106;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_VexRiscv_107;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_VexRiscv_108;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_VexRiscv_109;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_VexRiscv_110;
  reg        [31:0]   _zz_VexRiscv_111;
  wire                _zz_VexRiscv_112;
  reg        [19:0]   _zz_VexRiscv_113;
  wire                _zz_VexRiscv_114;
  reg        [19:0]   _zz_VexRiscv_115;
  reg        [31:0]   _zz_VexRiscv_116;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  reg                 execute_LightShifterPlugin_isActive;
  wire                execute_LightShifterPlugin_isShift;
  reg        [4:0]    execute_LightShifterPlugin_amplitudeReg;
  wire       [4:0]    execute_LightShifterPlugin_amplitude;
  wire       [31:0]   execute_LightShifterPlugin_shiftInput;
  wire                execute_LightShifterPlugin_done;
  reg        [31:0]   _zz_VexRiscv_117;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                _zz_VexRiscv_118;
  wire                _zz_VexRiscv_119;
  wire                _zz_VexRiscv_120;
  wire                _zz_VexRiscv_121;
  wire                _zz_VexRiscv_122;
  wire                _zz_VexRiscv_123;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_VexRiscv_124;
  reg                 _zz_VexRiscv_125;
  reg                 _zz_VexRiscv_126;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_VexRiscv_127;
  reg        [10:0]   _zz_VexRiscv_128;
  wire                _zz_VexRiscv_129;
  reg        [19:0]   _zz_VexRiscv_130;
  wire                _zz_VexRiscv_131;
  reg        [18:0]   _zz_VexRiscv_132;
  reg        [31:0]   _zz_VexRiscv_133;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_VexRiscv_134;
  reg                 _zz_VexRiscv_135;
  reg                 DebugPlugin_resetIt_regNext;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 memory_to_writeBack_MEMORY_STORE;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg        [31:0]   decode_to_execute_SRC1;
  reg        [31:0]   decode_to_execute_SRC2;
  reg                 decode_to_execute_DO_EBREAK;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg        [2:0]    _zz_VexRiscv_136;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg                 execute_CsrPlugin_csr_3072;
  reg                 execute_CsrPlugin_csr_3200;
  reg        [31:0]   _zz_VexRiscv_137;
  reg        [31:0]   _zz_VexRiscv_138;
  reg        [31:0]   _zz_VexRiscv_139;
  reg        [31:0]   _zz_VexRiscv_140;
  reg        [31:0]   _zz_VexRiscv_141;
  reg        [31:0]   _zz_VexRiscv_142;
  reg        [31:0]   _zz_VexRiscv_143;
  reg        [31:0]   _zz_VexRiscv_144;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_VexRiscv_1_string;
  reg [31:0] _zz_VexRiscv_2_string;
  reg [31:0] _zz_VexRiscv_3_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_VexRiscv_4_string;
  reg [71:0] _zz_VexRiscv_5_string;
  reg [71:0] _zz_VexRiscv_6_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_VexRiscv_7_string;
  reg [39:0] _zz_VexRiscv_8_string;
  reg [39:0] _zz_VexRiscv_9_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_VexRiscv_10_string;
  reg [63:0] _zz_VexRiscv_11_string;
  reg [63:0] _zz_VexRiscv_12_string;
  reg [47:0] _zz_VexRiscv_13_string;
  reg [47:0] _zz_VexRiscv_14_string;
  reg [47:0] _zz_VexRiscv_15_string;
  reg [47:0] _zz_VexRiscv_16_string;
  reg [47:0] decode_ENV_CTRL_string;
  reg [47:0] _zz_VexRiscv_17_string;
  reg [47:0] _zz_VexRiscv_18_string;
  reg [47:0] _zz_VexRiscv_19_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_VexRiscv_20_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_VexRiscv_22_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_VexRiscv_25_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_VexRiscv_27_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_VexRiscv_28_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_VexRiscv_29_string;
  reg [31:0] _zz_VexRiscv_33_string;
  reg [71:0] _zz_VexRiscv_34_string;
  reg [39:0] _zz_VexRiscv_35_string;
  reg [63:0] _zz_VexRiscv_36_string;
  reg [47:0] _zz_VexRiscv_37_string;
  reg [23:0] _zz_VexRiscv_38_string;
  reg [95:0] _zz_VexRiscv_39_string;
  reg [47:0] memory_ENV_CTRL_string;
  reg [47:0] _zz_VexRiscv_41_string;
  reg [47:0] execute_ENV_CTRL_string;
  reg [47:0] _zz_VexRiscv_42_string;
  reg [47:0] writeBack_ENV_CTRL_string;
  reg [47:0] _zz_VexRiscv_43_string;
  reg [95:0] _zz_VexRiscv_102_string;
  reg [23:0] _zz_VexRiscv_103_string;
  reg [47:0] _zz_VexRiscv_104_string;
  reg [63:0] _zz_VexRiscv_105_string;
  reg [39:0] _zz_VexRiscv_106_string;
  reg [71:0] _zz_VexRiscv_107_string;
  reg [31:0] _zz_VexRiscv_108_string;
  reg [47:0] decode_to_execute_ENV_CTRL_string;
  reg [47:0] execute_to_memory_ENV_CTRL_string;
  reg [47:0] memory_to_writeBack_ENV_CTRL_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_VexRiscv_149 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_150 = 1'b1;
  assign _zz_VexRiscv_151 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_152 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_153 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_VexRiscv_154 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != 5'h0));
  assign _zz_VexRiscv_155 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_VexRiscv_156 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign _zz_VexRiscv_157 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_VexRiscv_158 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_VexRiscv_159 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign _zz_VexRiscv_160 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_VexRiscv_161 = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign _zz_VexRiscv_162 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign _zz_VexRiscv_163 = ((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_EBREAK)) && CsrPlugin_allowEbreakException);
  assign _zz_VexRiscv_164 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_165 = (1'b0 || (! 1'b1));
  assign _zz_VexRiscv_166 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_167 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_VexRiscv_168 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_VexRiscv_169 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_VexRiscv_170 = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_VexRiscv_171 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign _zz_VexRiscv_172 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign _zz_VexRiscv_173 = ((_zz_VexRiscv_92 && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_174 = ((_zz_VexRiscv_93 && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_175 = ((_zz_VexRiscv_94 && 1'b1) && (! 1'b0));
  assign _zz_VexRiscv_176 = (! execute_arbitration_isStuckByOthers);
  assign _zz_VexRiscv_177 = {_zz_VexRiscv_52[1 : 0],_zz_VexRiscv_52[15 : 13]};
  assign _zz_VexRiscv_178 = _zz_VexRiscv_52[6 : 5];
  assign _zz_VexRiscv_179 = _zz_VexRiscv_52[11 : 10];
  assign _zz_VexRiscv_180 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_VexRiscv_181 = execute_INSTRUCTION[13];
  assign _zz_VexRiscv_182 = _zz_VexRiscv_95[19 : 19];
  assign _zz_VexRiscv_183 = _zz_VexRiscv_95[12 : 12];
  assign _zz_VexRiscv_184 = _zz_VexRiscv_95[10 : 10];
  assign _zz_VexRiscv_185 = _zz_VexRiscv_95[9 : 9];
  assign _zz_VexRiscv_186 = _zz_VexRiscv_95[8 : 8];
  assign _zz_VexRiscv_187 = _zz_VexRiscv_95[3 : 3];
  assign _zz_VexRiscv_188 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_VexRiscv_189 = {29'd0, _zz_VexRiscv_188};
  assign _zz_VexRiscv_190 = _zz_VexRiscv_95[16 : 16];
  assign _zz_VexRiscv_191 = _zz_VexRiscv_95[11 : 11];
  assign _zz_VexRiscv_192 = _zz_VexRiscv_95[4 : 4];
  assign _zz_VexRiscv_193 = _zz_VexRiscv_95[2 : 2];
  assign _zz_VexRiscv_194 = _zz_VexRiscv_95[22 : 22];
  assign _zz_VexRiscv_195 = _zz_VexRiscv_95[7 : 7];
  assign _zz_VexRiscv_196 = (_zz_VexRiscv_46 & (~ _zz_VexRiscv_197));
  assign _zz_VexRiscv_197 = (_zz_VexRiscv_46 - 2'b01);
  assign _zz_VexRiscv_198 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_VexRiscv_199 = {29'd0, _zz_VexRiscv_198};
  assign _zz_VexRiscv_200 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_VexRiscv_201 = {29'd0, _zz_VexRiscv_200};
  assign _zz_VexRiscv_202 = {{_zz_VexRiscv_62,_zz_VexRiscv_52[6 : 2]},12'h0};
  assign _zz_VexRiscv_203 = {{{4'b0000,_zz_VexRiscv_52[8 : 7]},_zz_VexRiscv_52[12 : 9]},2'b00};
  assign _zz_VexRiscv_204 = {{{4'b0000,_zz_VexRiscv_52[8 : 7]},_zz_VexRiscv_52[12 : 9]},2'b00};
  assign _zz_VexRiscv_205 = (IBusSimplePlugin_pending_value + _zz_VexRiscv_207);
  assign _zz_VexRiscv_206 = IBusSimplePlugin_pending_inc;
  assign _zz_VexRiscv_207 = {2'd0, _zz_VexRiscv_206};
  assign _zz_VexRiscv_208 = IBusSimplePlugin_pending_dec;
  assign _zz_VexRiscv_209 = {2'd0, _zz_VexRiscv_208};
  assign _zz_VexRiscv_210 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_VexRiscv_211 = {2'd0, _zz_VexRiscv_210};
  assign _zz_VexRiscv_212 = IBusSimplePlugin_pending_dec;
  assign _zz_VexRiscv_213 = {2'd0, _zz_VexRiscv_212};
  assign _zz_VexRiscv_214 = execute_SRC_LESS;
  assign _zz_VexRiscv_215 = (decode_IS_RVC ? 3'b010 : 3'b100);
  assign _zz_VexRiscv_216 = decode_INSTRUCTION[19 : 15];
  assign _zz_VexRiscv_217 = decode_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_218 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_VexRiscv_219 = ($signed(_zz_VexRiscv_220) + $signed(_zz_VexRiscv_223));
  assign _zz_VexRiscv_220 = ($signed(_zz_VexRiscv_221) + $signed(_zz_VexRiscv_222));
  assign _zz_VexRiscv_221 = execute_SRC1;
  assign _zz_VexRiscv_222 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_VexRiscv_223 = (execute_SRC_USE_SUB_LESS ? _zz_VexRiscv_224 : _zz_VexRiscv_225);
  assign _zz_VexRiscv_224 = 32'h00000001;
  assign _zz_VexRiscv_225 = 32'h0;
  assign _zz_VexRiscv_226 = (_zz_VexRiscv_227 >>> 1);
  assign _zz_VexRiscv_227 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _zz_VexRiscv_228 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_VexRiscv_229 = execute_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_230 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_VexRiscv_231 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_VexRiscv_232 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_233 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_234 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_VexRiscv_235 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_VexRiscv_236 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_VexRiscv_237 = 1'b1;
  assign _zz_VexRiscv_238 = 1'b1;
  assign _zz_VexRiscv_239 = (_zz_VexRiscv_52[11 : 10] == 2'b01);
  assign _zz_VexRiscv_240 = ((_zz_VexRiscv_52[11 : 10] == 2'b11) && (_zz_VexRiscv_52[6 : 5] == 2'b00));
  assign _zz_VexRiscv_241 = 7'h0;
  assign _zz_VexRiscv_242 = _zz_VexRiscv_52[6 : 2];
  assign _zz_VexRiscv_243 = _zz_VexRiscv_52[12];
  assign _zz_VexRiscv_244 = _zz_VexRiscv_52[11 : 7];
  assign _zz_VexRiscv_245 = (decode_INSTRUCTION & 32'h0000001c);
  assign _zz_VexRiscv_246 = 32'h00000004;
  assign _zz_VexRiscv_247 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_VexRiscv_248 = 32'h00000040;
  assign _zz_VexRiscv_249 = ((decode_INSTRUCTION & 32'h00007054) == 32'h00005010);
  assign _zz_VexRiscv_250 = {(_zz_VexRiscv_255 == _zz_VexRiscv_256),(_zz_VexRiscv_257 == _zz_VexRiscv_258)};
  assign _zz_VexRiscv_251 = 2'b00;
  assign _zz_VexRiscv_252 = ({_zz_VexRiscv_259,_zz_VexRiscv_260} != 2'b00);
  assign _zz_VexRiscv_253 = (_zz_VexRiscv_261 != 1'b0);
  assign _zz_VexRiscv_254 = {(_zz_VexRiscv_262 != _zz_VexRiscv_263),{_zz_VexRiscv_264,{_zz_VexRiscv_265,_zz_VexRiscv_266}}};
  assign _zz_VexRiscv_255 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_VexRiscv_256 = 32'h40001010;
  assign _zz_VexRiscv_257 = (decode_INSTRUCTION & 32'h00007054);
  assign _zz_VexRiscv_258 = 32'h00001010;
  assign _zz_VexRiscv_259 = ((decode_INSTRUCTION & 32'h00000064) == 32'h00000024);
  assign _zz_VexRiscv_260 = ((decode_INSTRUCTION & 32'h00003054) == 32'h00001010);
  assign _zz_VexRiscv_261 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_VexRiscv_262 = ((decode_INSTRUCTION & _zz_VexRiscv_267) == 32'h00002000);
  assign _zz_VexRiscv_263 = 1'b0;
  assign _zz_VexRiscv_264 = ({_zz_VexRiscv_268,_zz_VexRiscv_269} != 2'b00);
  assign _zz_VexRiscv_265 = ({_zz_VexRiscv_270,_zz_VexRiscv_271} != 2'b00);
  assign _zz_VexRiscv_266 = {(_zz_VexRiscv_272 != _zz_VexRiscv_273),{_zz_VexRiscv_274,{_zz_VexRiscv_275,_zz_VexRiscv_276}}};
  assign _zz_VexRiscv_267 = 32'h00003000;
  assign _zz_VexRiscv_268 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz_VexRiscv_269 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz_VexRiscv_270 = ((decode_INSTRUCTION & _zz_VexRiscv_277) == 32'h00006000);
  assign _zz_VexRiscv_271 = ((decode_INSTRUCTION & _zz_VexRiscv_278) == 32'h00004000);
  assign _zz_VexRiscv_272 = _zz_VexRiscv_97;
  assign _zz_VexRiscv_273 = 1'b0;
  assign _zz_VexRiscv_274 = (_zz_VexRiscv_101 != 1'b0);
  assign _zz_VexRiscv_275 = ({_zz_VexRiscv_279,_zz_VexRiscv_280} != 2'b00);
  assign _zz_VexRiscv_276 = {(_zz_VexRiscv_281 != _zz_VexRiscv_282),{_zz_VexRiscv_283,{_zz_VexRiscv_284,_zz_VexRiscv_285}}};
  assign _zz_VexRiscv_277 = 32'h00006004;
  assign _zz_VexRiscv_278 = 32'h00005004;
  assign _zz_VexRiscv_279 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000040);
  assign _zz_VexRiscv_280 = ((decode_INSTRUCTION & 32'h00003040) == 32'h00000040);
  assign _zz_VexRiscv_281 = _zz_VexRiscv_101;
  assign _zz_VexRiscv_282 = 1'b0;
  assign _zz_VexRiscv_283 = (((decode_INSTRUCTION & _zz_VexRiscv_286) == 32'h00000050) != 1'b0);
  assign _zz_VexRiscv_284 = ({_zz_VexRiscv_287,_zz_VexRiscv_288} != 2'b00);
  assign _zz_VexRiscv_285 = {({_zz_VexRiscv_289,_zz_VexRiscv_290} != 2'b00),{(_zz_VexRiscv_291 != _zz_VexRiscv_292),{_zz_VexRiscv_293,{_zz_VexRiscv_294,_zz_VexRiscv_295}}}};
  assign _zz_VexRiscv_286 = 32'h00103050;
  assign _zz_VexRiscv_287 = ((decode_INSTRUCTION & 32'h00001050) == 32'h00001050);
  assign _zz_VexRiscv_288 = ((decode_INSTRUCTION & 32'h00002050) == 32'h00002050);
  assign _zz_VexRiscv_289 = ((decode_INSTRUCTION & _zz_VexRiscv_296) == 32'h00000020);
  assign _zz_VexRiscv_290 = ((decode_INSTRUCTION & _zz_VexRiscv_297) == 32'h00000020);
  assign _zz_VexRiscv_291 = ((decode_INSTRUCTION & _zz_VexRiscv_298) == 32'h00000020);
  assign _zz_VexRiscv_292 = 1'b0;
  assign _zz_VexRiscv_293 = ((_zz_VexRiscv_299 == _zz_VexRiscv_300) != 1'b0);
  assign _zz_VexRiscv_294 = (_zz_VexRiscv_99 != 1'b0);
  assign _zz_VexRiscv_295 = {(_zz_VexRiscv_301 != _zz_VexRiscv_302),{_zz_VexRiscv_303,{_zz_VexRiscv_304,_zz_VexRiscv_305}}};
  assign _zz_VexRiscv_296 = 32'h00000034;
  assign _zz_VexRiscv_297 = 32'h00000064;
  assign _zz_VexRiscv_298 = 32'h00000020;
  assign _zz_VexRiscv_299 = (decode_INSTRUCTION & 32'h00000010);
  assign _zz_VexRiscv_300 = 32'h00000010;
  assign _zz_VexRiscv_301 = {_zz_VexRiscv_100,{(_zz_VexRiscv_306 == _zz_VexRiscv_307),{_zz_VexRiscv_308,{_zz_VexRiscv_309,_zz_VexRiscv_310}}}};
  assign _zz_VexRiscv_302 = 6'h0;
  assign _zz_VexRiscv_303 = ({_zz_VexRiscv_98,(_zz_VexRiscv_311 == _zz_VexRiscv_312)} != 2'b00);
  assign _zz_VexRiscv_304 = ({_zz_VexRiscv_98,_zz_VexRiscv_313} != 2'b00);
  assign _zz_VexRiscv_305 = {({_zz_VexRiscv_314,_zz_VexRiscv_315} != 4'b0000),{(_zz_VexRiscv_316 != _zz_VexRiscv_317),{_zz_VexRiscv_318,{_zz_VexRiscv_319,_zz_VexRiscv_320}}}};
  assign _zz_VexRiscv_306 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_VexRiscv_307 = 32'h00001010;
  assign _zz_VexRiscv_308 = ((decode_INSTRUCTION & _zz_VexRiscv_321) == 32'h00002010);
  assign _zz_VexRiscv_309 = _zz_VexRiscv_99;
  assign _zz_VexRiscv_310 = {_zz_VexRiscv_322,_zz_VexRiscv_323};
  assign _zz_VexRiscv_311 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_VexRiscv_312 = 32'h00000020;
  assign _zz_VexRiscv_313 = ((decode_INSTRUCTION & _zz_VexRiscv_324) == 32'h0);
  assign _zz_VexRiscv_314 = (_zz_VexRiscv_325 == _zz_VexRiscv_326);
  assign _zz_VexRiscv_315 = {_zz_VexRiscv_327,{_zz_VexRiscv_328,_zz_VexRiscv_329}};
  assign _zz_VexRiscv_316 = (_zz_VexRiscv_330 == _zz_VexRiscv_331);
  assign _zz_VexRiscv_317 = 1'b0;
  assign _zz_VexRiscv_318 = ({_zz_VexRiscv_332,_zz_VexRiscv_333} != 3'b000);
  assign _zz_VexRiscv_319 = (_zz_VexRiscv_334 != _zz_VexRiscv_335);
  assign _zz_VexRiscv_320 = (_zz_VexRiscv_336 != _zz_VexRiscv_337);
  assign _zz_VexRiscv_321 = 32'h00002010;
  assign _zz_VexRiscv_322 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_VexRiscv_323 = ((decode_INSTRUCTION & 32'h00000028) == 32'h0);
  assign _zz_VexRiscv_324 = 32'h00000020;
  assign _zz_VexRiscv_325 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_VexRiscv_326 = 32'h0;
  assign _zz_VexRiscv_327 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_VexRiscv_328 = _zz_VexRiscv_97;
  assign _zz_VexRiscv_329 = ((decode_INSTRUCTION & _zz_VexRiscv_338) == 32'h00001000);
  assign _zz_VexRiscv_330 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_VexRiscv_331 = 32'h0;
  assign _zz_VexRiscv_332 = ((decode_INSTRUCTION & _zz_VexRiscv_339) == 32'h00000040);
  assign _zz_VexRiscv_333 = {(_zz_VexRiscv_340 == _zz_VexRiscv_341),(_zz_VexRiscv_342 == _zz_VexRiscv_343)};
  assign _zz_VexRiscv_334 = {(_zz_VexRiscv_344 == _zz_VexRiscv_345),_zz_VexRiscv_96};
  assign _zz_VexRiscv_335 = 2'b00;
  assign _zz_VexRiscv_336 = {(_zz_VexRiscv_346 == _zz_VexRiscv_347),_zz_VexRiscv_96};
  assign _zz_VexRiscv_337 = 2'b00;
  assign _zz_VexRiscv_338 = 32'h00005004;
  assign _zz_VexRiscv_339 = 32'h00000044;
  assign _zz_VexRiscv_340 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz_VexRiscv_341 = 32'h00002010;
  assign _zz_VexRiscv_342 = (decode_INSTRUCTION & 32'h40004034);
  assign _zz_VexRiscv_343 = 32'h40000030;
  assign _zz_VexRiscv_344 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz_VexRiscv_345 = 32'h00000004;
  assign _zz_VexRiscv_346 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_VexRiscv_347 = 32'h00000004;
  always @ (posedge clk) begin
    if(_zz_VexRiscv_237) begin
      _zz_VexRiscv_147 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge clk) begin
    if(_zz_VexRiscv_238) begin
      _zz_VexRiscv_148 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge clk) begin
    if(_zz_VexRiscv_32) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid            (iBus_rsp_valid                                                  ), //i
    .io_push_ready            (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error    (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst     (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready             (_zz_VexRiscv_145                                                ), //i
    .io_pop_payload_error     (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst      (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                 (_zz_VexRiscv_146                                                ), //i
    .io_occupancy             (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .clk                      (clk                                                             ), //i
    .reset                    (reset                                                           )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_1)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_1_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_1_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_1_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_1_string = "JALR";
      default : _zz_VexRiscv_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_2)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_2_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_2_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_2_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_2_string = "JALR";
      default : _zz_VexRiscv_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_3)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_3_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_3_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_3_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_3_string = "JALR";
      default : _zz_VexRiscv_3_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_4)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_4_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_4_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_4_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_4_string = "SRA_1    ";
      default : _zz_VexRiscv_4_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_5)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_5_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_5_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_5_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_5_string = "SRA_1    ";
      default : _zz_VexRiscv_5_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_6)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_6_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_6_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_6_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_6_string = "SRA_1    ";
      default : _zz_VexRiscv_6_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_7)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_7_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_7_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_7_string = "AND_1";
      default : _zz_VexRiscv_7_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_8)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_8_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_8_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_8_string = "AND_1";
      default : _zz_VexRiscv_8_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_9)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_9_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_9_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_9_string = "AND_1";
      default : _zz_VexRiscv_9_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_10)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_10_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_10_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_10_string = "BITWISE ";
      default : _zz_VexRiscv_10_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_11)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_11_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_11_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_11_string = "BITWISE ";
      default : _zz_VexRiscv_11_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_12)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_12_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_12_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_12_string = "BITWISE ";
      default : _zz_VexRiscv_12_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_13)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_13_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_13_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_13_string = "EBREAK";
      default : _zz_VexRiscv_13_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_14)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_14_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_14_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_14_string = "EBREAK";
      default : _zz_VexRiscv_14_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_15)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_15_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_15_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_15_string = "EBREAK";
      default : _zz_VexRiscv_15_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_16)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_16_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_16_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_16_string = "EBREAK";
      default : _zz_VexRiscv_16_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : decode_ENV_CTRL_string = "EBREAK";
      default : decode_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_17)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_17_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_17_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_17_string = "EBREAK";
      default : _zz_VexRiscv_17_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_18)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_18_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_18_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_18_string = "EBREAK";
      default : _zz_VexRiscv_18_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_19)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_19_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_19_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_19_string = "EBREAK";
      default : _zz_VexRiscv_19_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_20)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_20_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_20_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_20_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_20_string = "JALR";
      default : _zz_VexRiscv_20_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_22)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_22_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_22_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_22_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_22_string = "SRA_1    ";
      default : _zz_VexRiscv_22_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_25)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_25_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_25_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_25_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_25_string = "PC ";
      default : _zz_VexRiscv_25_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_27)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_27_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_27_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_27_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_27_string = "URS1        ";
      default : _zz_VexRiscv_27_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_28)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_28_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_28_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_28_string = "BITWISE ";
      default : _zz_VexRiscv_28_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_29)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_29_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_29_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_29_string = "AND_1";
      default : _zz_VexRiscv_29_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_33)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_33_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_33_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_33_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_33_string = "JALR";
      default : _zz_VexRiscv_33_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_34)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_34_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_34_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_34_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_34_string = "SRA_1    ";
      default : _zz_VexRiscv_34_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_35)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_35_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_35_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_35_string = "AND_1";
      default : _zz_VexRiscv_35_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_36)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_36_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_36_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_36_string = "BITWISE ";
      default : _zz_VexRiscv_36_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_37)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_37_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_37_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_37_string = "EBREAK";
      default : _zz_VexRiscv_37_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_38)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_38_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_38_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_38_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_38_string = "PC ";
      default : _zz_VexRiscv_38_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_39)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_39_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_39_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_39_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_39_string = "URS1        ";
      default : _zz_VexRiscv_39_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : memory_ENV_CTRL_string = "EBREAK";
      default : memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_41)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_41_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_41_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_41_string = "EBREAK";
      default : _zz_VexRiscv_41_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : execute_ENV_CTRL_string = "EBREAK";
      default : execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_42)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_42_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_42_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_42_string = "EBREAK";
      default : _zz_VexRiscv_42_string = "??????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : writeBack_ENV_CTRL_string = "EBREAK";
      default : writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_43)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_43_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_43_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_43_string = "EBREAK";
      default : _zz_VexRiscv_43_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_102)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_102_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_VexRiscv_102_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_VexRiscv_102_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_VexRiscv_102_string = "URS1        ";
      default : _zz_VexRiscv_102_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_103)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_VexRiscv_103_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_VexRiscv_103_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_VexRiscv_103_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_VexRiscv_103_string = "PC ";
      default : _zz_VexRiscv_103_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_104)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_VexRiscv_104_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_VexRiscv_104_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : _zz_VexRiscv_104_string = "EBREAK";
      default : _zz_VexRiscv_104_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_105)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_VexRiscv_105_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_VexRiscv_105_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_VexRiscv_105_string = "BITWISE ";
      default : _zz_VexRiscv_105_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_106)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_VexRiscv_106_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_VexRiscv_106_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_VexRiscv_106_string = "AND_1";
      default : _zz_VexRiscv_106_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_107)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_VexRiscv_107_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_VexRiscv_107_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_VexRiscv_107_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_VexRiscv_107_string = "SRA_1    ";
      default : _zz_VexRiscv_107_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_VexRiscv_108)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_VexRiscv_108_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_VexRiscv_108_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_VexRiscv_108_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_VexRiscv_108_string = "JALR";
      default : _zz_VexRiscv_108_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : decode_to_execute_ENV_CTRL_string = "EBREAK";
      default : decode_to_execute_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : execute_to_memory_ENV_CTRL_string = "EBREAK";
      default : execute_to_memory_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE  ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET  ";
      `EnvCtrlEnum_defaultEncoding_EBREAK : memory_to_writeBack_ENV_CTRL_string = "EBREAK";
      default : memory_to_writeBack_ENV_CTRL_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_VexRiscv_126;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_VexRiscv_110;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0)) && DebugPlugin_allowEBreak);
  assign decode_SRC2 = _zz_VexRiscv_116;
  assign decode_SRC1 = _zz_VexRiscv_111;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign decode_BRANCH_CTRL = _zz_VexRiscv_1;
  assign _zz_VexRiscv_2 = _zz_VexRiscv_3;
  assign decode_SHIFT_CTRL = _zz_VexRiscv_4;
  assign _zz_VexRiscv_5 = _zz_VexRiscv_6;
  assign decode_ALU_BITWISE_CTRL = _zz_VexRiscv_7;
  assign _zz_VexRiscv_8 = _zz_VexRiscv_9;
  assign decode_SRC_LESS_UNSIGNED = _zz_VexRiscv_182[0];
  assign decode_ALU_CTRL = _zz_VexRiscv_10;
  assign _zz_VexRiscv_11 = _zz_VexRiscv_12;
  assign _zz_VexRiscv_13 = _zz_VexRiscv_14;
  assign _zz_VexRiscv_15 = _zz_VexRiscv_16;
  assign decode_ENV_CTRL = _zz_VexRiscv_17;
  assign _zz_VexRiscv_18 = _zz_VexRiscv_19;
  assign decode_IS_CSR = _zz_VexRiscv_183[0];
  assign decode_MEMORY_STORE = _zz_VexRiscv_184[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_VexRiscv_185[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_VexRiscv_186[0];
  assign decode_MEMORY_ENABLE = _zz_VexRiscv_187[0];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_VexRiscv_189);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_VexRiscv_190[0];
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_VexRiscv_20;
  assign decode_RS2_USE = _zz_VexRiscv_191[0];
  assign decode_RS1_USE = _zz_VexRiscv_192[0];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign _zz_VexRiscv_21 = memory_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid)begin
      if(HazardSimplePlugin_addr1Match)begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(_zz_VexRiscv_149)begin
      if(_zz_VexRiscv_150)begin
        if(_zz_VexRiscv_119)begin
          decode_RS2 = _zz_VexRiscv_44;
        end
      end
    end
    if(_zz_VexRiscv_151)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_VexRiscv_121)begin
          decode_RS2 = _zz_VexRiscv_21;
        end
      end
    end
    if(_zz_VexRiscv_152)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_VexRiscv_123)begin
          decode_RS2 = _zz_VexRiscv_40;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid)begin
      if(HazardSimplePlugin_addr0Match)begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(_zz_VexRiscv_149)begin
      if(_zz_VexRiscv_150)begin
        if(_zz_VexRiscv_118)begin
          decode_RS1 = _zz_VexRiscv_44;
        end
      end
    end
    if(_zz_VexRiscv_151)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_VexRiscv_120)begin
          decode_RS1 = _zz_VexRiscv_21;
        end
      end
    end
    if(_zz_VexRiscv_152)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_VexRiscv_122)begin
          decode_RS1 = _zz_VexRiscv_40;
        end
      end
    end
  end

  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_SHIFT_CTRL = _zz_VexRiscv_22;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_VexRiscv_23 = decode_PC;
  assign _zz_VexRiscv_24 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_VexRiscv_25;
  assign _zz_VexRiscv_26 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_VexRiscv_27;
  assign decode_SRC_USE_SUB_LESS = _zz_VexRiscv_193[0];
  assign decode_SRC_ADD_ZERO = _zz_VexRiscv_194[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_VexRiscv_28;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_VexRiscv_29;
  assign _zz_VexRiscv_30 = writeBack_INSTRUCTION;
  assign _zz_VexRiscv_31 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_VexRiscv_32 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_VexRiscv_32 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_decompressor_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_VexRiscv_195[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_40 = execute_REGFILE_WRITE_DATA;
    if(_zz_VexRiscv_153)begin
      _zz_VexRiscv_40 = execute_CsrPlugin_readData;
    end
    if(_zz_VexRiscv_154)begin
      _zz_VexRiscv_40 = _zz_VexRiscv_117;
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_VexRiscv_41;
  assign execute_ENV_CTRL = _zz_VexRiscv_42;
  assign writeBack_ENV_CTRL = _zz_VexRiscv_43;
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_VexRiscv_44 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_VexRiscv_44 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  always @ (*) begin
    _zz_VexRiscv_45 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_VexRiscv_45 = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    case(_zz_VexRiscv_136)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != 3'b000))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  assign decode_arbitration_flushNext = 1'b0;
  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_VexRiscv_85)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_VexRiscv_153)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
    if(_zz_VexRiscv_154)begin
      if((! execute_LightShifterPlugin_done))begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(_zz_VexRiscv_155)begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(_zz_VexRiscv_155)begin
      if(_zz_VexRiscv_156)begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_VexRiscv_155)begin
      if(_zz_VexRiscv_156)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
    if(_zz_VexRiscv_135)begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_VexRiscv_157)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_VexRiscv_158)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000))begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_157)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_158)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_155)begin
      if(_zz_VexRiscv_156)begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_VexRiscv_159)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt)begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_VexRiscv_157)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_VexRiscv_158)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(_zz_VexRiscv_157)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(_zz_VexRiscv_158)begin
      case(_zz_VexRiscv_160)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode)begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak)begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid} != 2'b00);
  assign _zz_VexRiscv_46 = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_VexRiscv_196[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_VexRiscv_199);
    if(IBusSimplePlugin_fetchPc_inc)begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @ (*) begin
    IBusSimplePlugin_decodePc_flushed = 1'b0;
    if(_zz_VexRiscv_161)begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_VexRiscv_201);
  always @ (*) begin
    IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
    if((_zz_VexRiscv_136 != 3'b000))begin
      IBusSimplePlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_VexRiscv_47 = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_VexRiscv_47);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_VexRiscv_47);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_VexRiscv_48 = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_VexRiscv_48);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_VexRiscv_48);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_VexRiscv_49;
  assign _zz_VexRiscv_49 = ((1'b0 && (! _zz_VexRiscv_50)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_VexRiscv_50 = _zz_VexRiscv_51;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_VexRiscv_50;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_decompressor_input_valid = (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_iBusRsp_redoFetch));
  assign IBusSimplePlugin_decompressor_input_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_error = IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_inst = IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusSimplePlugin_decompressor_input_payload_isRvc = IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  assign IBusSimplePlugin_iBusRsp_output_ready = IBusSimplePlugin_decompressor_input_ready;
  assign IBusSimplePlugin_decompressor_flushNext = 1'b0;
  assign IBusSimplePlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusSimplePlugin_decompressor_isInputLowRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[1 : 0] != 2'b11);
  assign IBusSimplePlugin_decompressor_isInputHighRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[17 : 16] != 2'b11);
  assign IBusSimplePlugin_decompressor_throw2Bytes = (IBusSimplePlugin_decompressor_throw2BytesReg || IBusSimplePlugin_decompressor_input_payload_pc[1]);
  assign IBusSimplePlugin_decompressor_unaligned = (IBusSimplePlugin_decompressor_throw2Bytes || IBusSimplePlugin_decompressor_bufferValid);
  assign IBusSimplePlugin_decompressor_bufferValidPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_bufferValid : IBusSimplePlugin_decompressor_bufferValidLatch);
  assign IBusSimplePlugin_decompressor_throw2BytesPatched = (IBusSimplePlugin_decompressor_input_valid ? IBusSimplePlugin_decompressor_throw2Bytes : IBusSimplePlugin_decompressor_throw2BytesLatch);
  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValidPatched ? {IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusSimplePlugin_decompressor_throw2BytesPatched ? IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != 2'b11);
  assign _zz_VexRiscv_52 = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(_zz_VexRiscv_177)
      5'h0 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{2'b00,_zz_VexRiscv_52[10 : 7]},_zz_VexRiscv_52[12 : 11]},_zz_VexRiscv_52[5]},_zz_VexRiscv_52[6]},2'b00},5'h02},3'b000},_zz_VexRiscv_54},7'h13};
      end
      5'h02 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_55,_zz_VexRiscv_53},3'b010},_zz_VexRiscv_54},7'h03};
      end
      5'h06 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_55[11 : 5],_zz_VexRiscv_54},_zz_VexRiscv_53},3'b010},_zz_VexRiscv_55[4 : 0]},7'h23};
      end
      5'h08 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_57,_zz_VexRiscv_52[11 : 7]},3'b000},_zz_VexRiscv_52[11 : 7]},7'h13};
      end
      5'h09 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_60[20],_zz_VexRiscv_60[10 : 1]},_zz_VexRiscv_60[11]},_zz_VexRiscv_60[19 : 12]},_zz_VexRiscv_72},7'h6f};
      end
      5'h0a : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_VexRiscv_57,5'h0},3'b000},_zz_VexRiscv_52[11 : 7]},7'h13};
      end
      5'h0b : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_VexRiscv_52[11 : 7] == 5'h02) ? {{{{{{{{{_zz_VexRiscv_64,_zz_VexRiscv_52[4 : 3]},_zz_VexRiscv_52[5]},_zz_VexRiscv_52[2]},_zz_VexRiscv_52[6]},4'b0000},_zz_VexRiscv_52[11 : 7]},3'b000},_zz_VexRiscv_52[11 : 7]},7'h13} : {{_zz_VexRiscv_202[31 : 12],_zz_VexRiscv_52[11 : 7]},7'h37});
      end
      5'h0c : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_VexRiscv_52[11 : 10] == 2'b10) ? _zz_VexRiscv_78 : {{1'b0,(_zz_VexRiscv_239 || _zz_VexRiscv_240)},5'h0}),(((! _zz_VexRiscv_52[11]) || _zz_VexRiscv_74) ? _zz_VexRiscv_52[6 : 2] : _zz_VexRiscv_54)},_zz_VexRiscv_53},_zz_VexRiscv_76},_zz_VexRiscv_53},(_zz_VexRiscv_74 ? 7'h13 : 7'h33)};
      end
      5'h0d : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_67[20],_zz_VexRiscv_67[10 : 1]},_zz_VexRiscv_67[11]},_zz_VexRiscv_67[19 : 12]},_zz_VexRiscv_71},7'h6f};
      end
      5'h0e : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_VexRiscv_70[12],_zz_VexRiscv_70[10 : 5]},_zz_VexRiscv_71},_zz_VexRiscv_53},3'b000},_zz_VexRiscv_70[4 : 1]},_zz_VexRiscv_70[11]},7'h63};
      end
      5'h0f : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_VexRiscv_70[12],_zz_VexRiscv_70[10 : 5]},_zz_VexRiscv_71},_zz_VexRiscv_53},3'b001},_zz_VexRiscv_70[4 : 1]},_zz_VexRiscv_70[11]},7'h63};
      end
      5'h10 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h0,_zz_VexRiscv_52[6 : 2]},_zz_VexRiscv_52[11 : 7]},3'b001},_zz_VexRiscv_52[11 : 7]},7'h13};
      end
      5'h12 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{4'b0000,_zz_VexRiscv_52[3 : 2]},_zz_VexRiscv_52[12]},_zz_VexRiscv_52[6 : 4]},2'b00},_zz_VexRiscv_73},3'b010},_zz_VexRiscv_52[11 : 7]},7'h03};
      end
      5'h14 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_VexRiscv_52[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_VexRiscv_52[6 : 2] == 5'h0) ? {{{{12'h0,_zz_VexRiscv_52[11 : 7]},3'b000},(_zz_VexRiscv_52[12] ? _zz_VexRiscv_72 : _zz_VexRiscv_71)},7'h67} : {{{{{_zz_VexRiscv_241,_zz_VexRiscv_242},(_zz_VexRiscv_243 ? _zz_VexRiscv_244 : _zz_VexRiscv_71)},3'b000},_zz_VexRiscv_52[11 : 7]},7'h33}));
      end
      5'h16 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_VexRiscv_203[11 : 5],_zz_VexRiscv_52[6 : 2]},_zz_VexRiscv_73},3'b010},_zz_VexRiscv_204[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_VexRiscv_53 = {2'b01,_zz_VexRiscv_52[9 : 7]};
  assign _zz_VexRiscv_54 = {2'b01,_zz_VexRiscv_52[4 : 2]};
  assign _zz_VexRiscv_55 = {{{{5'h0,_zz_VexRiscv_52[5]},_zz_VexRiscv_52[12 : 10]},_zz_VexRiscv_52[6]},2'b00};
  assign _zz_VexRiscv_56 = _zz_VexRiscv_52[12];
  always @ (*) begin
    _zz_VexRiscv_57[11] = _zz_VexRiscv_56;
    _zz_VexRiscv_57[10] = _zz_VexRiscv_56;
    _zz_VexRiscv_57[9] = _zz_VexRiscv_56;
    _zz_VexRiscv_57[8] = _zz_VexRiscv_56;
    _zz_VexRiscv_57[7] = _zz_VexRiscv_56;
    _zz_VexRiscv_57[6] = _zz_VexRiscv_56;
    _zz_VexRiscv_57[5] = _zz_VexRiscv_56;
    _zz_VexRiscv_57[4 : 0] = _zz_VexRiscv_52[6 : 2];
  end

  assign _zz_VexRiscv_58 = _zz_VexRiscv_52[12];
  always @ (*) begin
    _zz_VexRiscv_59[9] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[8] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[7] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[6] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[5] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[4] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[3] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[2] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[1] = _zz_VexRiscv_58;
    _zz_VexRiscv_59[0] = _zz_VexRiscv_58;
  end

  assign _zz_VexRiscv_60 = {{{{{{{{_zz_VexRiscv_59,_zz_VexRiscv_52[8]},_zz_VexRiscv_52[10 : 9]},_zz_VexRiscv_52[6]},_zz_VexRiscv_52[7]},_zz_VexRiscv_52[2]},_zz_VexRiscv_52[11]},_zz_VexRiscv_52[5 : 3]},1'b0};
  assign _zz_VexRiscv_61 = _zz_VexRiscv_52[12];
  always @ (*) begin
    _zz_VexRiscv_62[14] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[13] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[12] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[11] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[10] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[9] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[8] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[7] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[6] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[5] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[4] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[3] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[2] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[1] = _zz_VexRiscv_61;
    _zz_VexRiscv_62[0] = _zz_VexRiscv_61;
  end

  assign _zz_VexRiscv_63 = _zz_VexRiscv_52[12];
  always @ (*) begin
    _zz_VexRiscv_64[2] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[1] = _zz_VexRiscv_63;
    _zz_VexRiscv_64[0] = _zz_VexRiscv_63;
  end

  assign _zz_VexRiscv_65 = _zz_VexRiscv_52[12];
  always @ (*) begin
    _zz_VexRiscv_66[9] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[8] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[7] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[6] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[5] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[4] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[3] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[2] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[1] = _zz_VexRiscv_65;
    _zz_VexRiscv_66[0] = _zz_VexRiscv_65;
  end

  assign _zz_VexRiscv_67 = {{{{{{{{_zz_VexRiscv_66,_zz_VexRiscv_52[8]},_zz_VexRiscv_52[10 : 9]},_zz_VexRiscv_52[6]},_zz_VexRiscv_52[7]},_zz_VexRiscv_52[2]},_zz_VexRiscv_52[11]},_zz_VexRiscv_52[5 : 3]},1'b0};
  assign _zz_VexRiscv_68 = _zz_VexRiscv_52[12];
  always @ (*) begin
    _zz_VexRiscv_69[4] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[3] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[2] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[1] = _zz_VexRiscv_68;
    _zz_VexRiscv_69[0] = _zz_VexRiscv_68;
  end

  assign _zz_VexRiscv_70 = {{{{{_zz_VexRiscv_69,_zz_VexRiscv_52[6 : 5]},_zz_VexRiscv_52[2]},_zz_VexRiscv_52[11 : 10]},_zz_VexRiscv_52[4 : 3]},1'b0};
  assign _zz_VexRiscv_71 = 5'h0;
  assign _zz_VexRiscv_72 = 5'h01;
  assign _zz_VexRiscv_73 = 5'h02;
  assign _zz_VexRiscv_74 = (_zz_VexRiscv_52[11 : 10] != 2'b11);
  always @ (*) begin
    case(_zz_VexRiscv_178)
      2'b00 : begin
        _zz_VexRiscv_75 = 3'b000;
      end
      2'b01 : begin
        _zz_VexRiscv_75 = 3'b100;
      end
      2'b10 : begin
        _zz_VexRiscv_75 = 3'b110;
      end
      default : begin
        _zz_VexRiscv_75 = 3'b111;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_VexRiscv_179)
      2'b00 : begin
        _zz_VexRiscv_76 = 3'b101;
      end
      2'b01 : begin
        _zz_VexRiscv_76 = 3'b101;
      end
      2'b10 : begin
        _zz_VexRiscv_76 = 3'b111;
      end
      default : begin
        _zz_VexRiscv_76 = _zz_VexRiscv_75;
      end
    endcase
  end

  assign _zz_VexRiscv_77 = _zz_VexRiscv_52[12];
  always @ (*) begin
    _zz_VexRiscv_78[6] = _zz_VexRiscv_77;
    _zz_VexRiscv_78[5] = _zz_VexRiscv_77;
    _zz_VexRiscv_78[4] = _zz_VexRiscv_77;
    _zz_VexRiscv_78[3] = _zz_VexRiscv_77;
    _zz_VexRiscv_78[2] = _zz_VexRiscv_77;
    _zz_VexRiscv_78[1] = _zz_VexRiscv_77;
    _zz_VexRiscv_78[0] = _zz_VexRiscv_77;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_1_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_VexRiscv_79;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_VexRiscv_80;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_VexRiscv_81;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_VexRiscv_82;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_VexRiscv_83;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @ (*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(_zz_VexRiscv_136)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_VexRiscv_205 - _zz_VexRiscv_209);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_VexRiscv_145 = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_VexRiscv_145);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_VexRiscv_84 = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_VexRiscv_84);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_VexRiscv_84);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_VexRiscv_85 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_VexRiscv_85));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_VexRiscv_86 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_VexRiscv_86 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_VexRiscv_86 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_VexRiscv_86;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_VexRiscv_87 = 4'b0001;
      end
      2'b01 : begin
        _zz_VexRiscv_87 = 4'b0011;
      end
      default : begin
        _zz_VexRiscv_87 = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_VexRiscv_87 <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_VexRiscv_88 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_VexRiscv_89[31] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[30] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[29] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[28] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[27] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[26] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[25] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[24] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[23] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[22] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[21] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[20] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[19] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[18] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[17] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[16] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[15] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[14] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[13] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[12] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[11] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[10] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[9] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[8] = _zz_VexRiscv_88;
    _zz_VexRiscv_89[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_VexRiscv_90 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_VexRiscv_91[31] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[30] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[29] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[28] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[27] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[26] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[25] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[24] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[23] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[22] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[21] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[20] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[19] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[18] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[17] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[16] = _zz_VexRiscv_90;
    _zz_VexRiscv_91[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_VexRiscv_180)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_VexRiscv_89;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_VexRiscv_91;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign CsrPlugin_mtvec_mode = 2'b00;
  assign CsrPlugin_mtvec_base = 30'h00000008;
  assign _zz_VexRiscv_92 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_VexRiscv_93 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_VexRiscv_94 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode = 1'b0;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3072)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_3200)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(_zz_VexRiscv_162)begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(_zz_VexRiscv_163)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = 4'bxxxx;
    if(_zz_VexRiscv_163)begin
      CsrPlugin_selfException_payload_code = 4'b0011;
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  always @ (*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(_zz_VexRiscv_162)begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(_zz_VexRiscv_162)begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_VexRiscv_181)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_VexRiscv_96 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_VexRiscv_97 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_VexRiscv_98 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_VexRiscv_99 = ((decode_INSTRUCTION & 32'h00000050) == 32'h00000010);
  assign _zz_VexRiscv_100 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_VexRiscv_101 = ((decode_INSTRUCTION & 32'h10003050) == 32'h00000050);
  assign _zz_VexRiscv_95 = {({_zz_VexRiscv_100,(_zz_VexRiscv_245 == _zz_VexRiscv_246)} != 2'b00),{((_zz_VexRiscv_247 == _zz_VexRiscv_248) != 1'b0),{(_zz_VexRiscv_249 != 1'b0),{(_zz_VexRiscv_250 != _zz_VexRiscv_251),{_zz_VexRiscv_252,{_zz_VexRiscv_253,_zz_VexRiscv_254}}}}}};
  assign _zz_VexRiscv_102 = _zz_VexRiscv_95[1 : 0];
  assign _zz_VexRiscv_39 = _zz_VexRiscv_102;
  assign _zz_VexRiscv_103 = _zz_VexRiscv_95[6 : 5];
  assign _zz_VexRiscv_38 = _zz_VexRiscv_103;
  assign _zz_VexRiscv_104 = _zz_VexRiscv_95[14 : 13];
  assign _zz_VexRiscv_37 = _zz_VexRiscv_104;
  assign _zz_VexRiscv_105 = _zz_VexRiscv_95[18 : 17];
  assign _zz_VexRiscv_36 = _zz_VexRiscv_105;
  assign _zz_VexRiscv_106 = _zz_VexRiscv_95[21 : 20];
  assign _zz_VexRiscv_35 = _zz_VexRiscv_106;
  assign _zz_VexRiscv_107 = _zz_VexRiscv_95[24 : 23];
  assign _zz_VexRiscv_34 = _zz_VexRiscv_107;
  assign _zz_VexRiscv_108 = _zz_VexRiscv_95[26 : 25];
  assign _zz_VexRiscv_33 = _zz_VexRiscv_108;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_VexRiscv_147;
  assign decode_RegFilePlugin_rs2Data = _zz_VexRiscv_148;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_VexRiscv_31 && writeBack_arbitration_isFiring);
    if(_zz_VexRiscv_109)begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_address = _zz_VexRiscv_30[11 : 7];
    if(_zz_VexRiscv_109)begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @ (*) begin
    lastStageRegFileWrite_payload_data = _zz_VexRiscv_44;
    if(_zz_VexRiscv_109)begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_VexRiscv_110 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_VexRiscv_110 = {31'd0, _zz_VexRiscv_214};
      end
      default : begin
        _zz_VexRiscv_110 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_VexRiscv_111 = _zz_VexRiscv_26;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_VexRiscv_111 = {29'd0, _zz_VexRiscv_215};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_VexRiscv_111 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_VexRiscv_111 = {27'd0, _zz_VexRiscv_216};
      end
    endcase
  end

  assign _zz_VexRiscv_112 = _zz_VexRiscv_217[11];
  always @ (*) begin
    _zz_VexRiscv_113[19] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[18] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[17] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[16] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[15] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[14] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[13] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[12] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[11] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[10] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[9] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[8] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[7] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[6] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[5] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[4] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[3] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[2] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[1] = _zz_VexRiscv_112;
    _zz_VexRiscv_113[0] = _zz_VexRiscv_112;
  end

  assign _zz_VexRiscv_114 = _zz_VexRiscv_218[11];
  always @ (*) begin
    _zz_VexRiscv_115[19] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[18] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[17] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[16] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[15] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[14] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[13] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[12] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[11] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[10] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[9] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[8] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[7] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[6] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[5] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[4] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[3] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[2] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[1] = _zz_VexRiscv_114;
    _zz_VexRiscv_115[0] = _zz_VexRiscv_114;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_VexRiscv_116 = _zz_VexRiscv_24;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_VexRiscv_116 = {_zz_VexRiscv_113,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_VexRiscv_116 = {_zz_VexRiscv_115,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_VexRiscv_116 = _zz_VexRiscv_23;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_VexRiscv_219;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != `ShiftCtrlEnum_defaultEncoding_DISABLE_1);
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : execute_SRC2[4 : 0]);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign execute_LightShifterPlugin_done = (execute_LightShifterPlugin_amplitude[4 : 1] == 4'b0000);
  always @ (*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
        _zz_VexRiscv_117 = (execute_LightShifterPlugin_shiftInput <<< 1);
      end
      default : begin
        _zz_VexRiscv_117 = _zz_VexRiscv_226;
      end
    endcase
  end

  always @ (*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(_zz_VexRiscv_164)begin
      if(_zz_VexRiscv_165)begin
        if(_zz_VexRiscv_118)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_166)begin
      if(_zz_VexRiscv_167)begin
        if(_zz_VexRiscv_120)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_168)begin
      if(_zz_VexRiscv_169)begin
        if(_zz_VexRiscv_122)begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @ (*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(_zz_VexRiscv_164)begin
      if(_zz_VexRiscv_165)begin
        if(_zz_VexRiscv_119)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_166)begin
      if(_zz_VexRiscv_167)begin
        if(_zz_VexRiscv_121)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(_zz_VexRiscv_168)begin
      if(_zz_VexRiscv_169)begin
        if(_zz_VexRiscv_123)begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_VexRiscv_31 && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_VexRiscv_30[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_VexRiscv_44;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign _zz_VexRiscv_118 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_119 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_VexRiscv_120 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_121 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_VexRiscv_122 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_VexRiscv_123 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_VexRiscv_124 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_VexRiscv_124 == 3'b000)) begin
        _zz_VexRiscv_125 = execute_BranchPlugin_eq;
    end else if((_zz_VexRiscv_124 == 3'b001)) begin
        _zz_VexRiscv_125 = (! execute_BranchPlugin_eq);
    end else if((((_zz_VexRiscv_124 & 3'b101) == 3'b101))) begin
        _zz_VexRiscv_125 = (! execute_SRC_LESS);
    end else begin
        _zz_VexRiscv_125 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_VexRiscv_126 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_VexRiscv_126 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_VexRiscv_126 = 1'b1;
      end
      default : begin
        _zz_VexRiscv_126 = _zz_VexRiscv_125;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JALR) ? execute_RS1 : execute_PC);
  assign _zz_VexRiscv_127 = _zz_VexRiscv_228[19];
  always @ (*) begin
    _zz_VexRiscv_128[10] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[9] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[8] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[7] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[6] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[5] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[4] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[3] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[2] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[1] = _zz_VexRiscv_127;
    _zz_VexRiscv_128[0] = _zz_VexRiscv_127;
  end

  assign _zz_VexRiscv_129 = _zz_VexRiscv_229[11];
  always @ (*) begin
    _zz_VexRiscv_130[19] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[18] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[17] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[16] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[15] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[14] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[13] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[12] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[11] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[10] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[9] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[8] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[7] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[6] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[5] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[4] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[3] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[2] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[1] = _zz_VexRiscv_129;
    _zz_VexRiscv_130[0] = _zz_VexRiscv_129;
  end

  assign _zz_VexRiscv_131 = _zz_VexRiscv_230[11];
  always @ (*) begin
    _zz_VexRiscv_132[18] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[17] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[16] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[15] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[14] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[13] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[12] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[11] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[10] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[9] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[8] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[7] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[6] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[5] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[4] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[3] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[2] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[1] = _zz_VexRiscv_131;
    _zz_VexRiscv_132[0] = _zz_VexRiscv_131;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_VexRiscv_133 = {{_zz_VexRiscv_128,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_VexRiscv_133 = {_zz_VexRiscv_130,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_VexRiscv_133 = {{_zz_VexRiscv_132,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_VexRiscv_133;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_VexRiscv_170)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr)begin
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_VexRiscv_134))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_VexRiscv_170)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_VexRiscv_27 = _zz_VexRiscv_39;
  assign _zz_VexRiscv_25 = _zz_VexRiscv_38;
  assign _zz_VexRiscv_19 = decode_ENV_CTRL;
  assign _zz_VexRiscv_16 = execute_ENV_CTRL;
  assign _zz_VexRiscv_14 = memory_ENV_CTRL;
  assign _zz_VexRiscv_17 = _zz_VexRiscv_37;
  assign _zz_VexRiscv_42 = decode_to_execute_ENV_CTRL;
  assign _zz_VexRiscv_41 = execute_to_memory_ENV_CTRL;
  assign _zz_VexRiscv_43 = memory_to_writeBack_ENV_CTRL;
  assign _zz_VexRiscv_12 = decode_ALU_CTRL;
  assign _zz_VexRiscv_10 = _zz_VexRiscv_36;
  assign _zz_VexRiscv_28 = decode_to_execute_ALU_CTRL;
  assign _zz_VexRiscv_9 = decode_ALU_BITWISE_CTRL;
  assign _zz_VexRiscv_7 = _zz_VexRiscv_35;
  assign _zz_VexRiscv_29 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_VexRiscv_6 = decode_SHIFT_CTRL;
  assign _zz_VexRiscv_4 = _zz_VexRiscv_34;
  assign _zz_VexRiscv_22 = decode_to_execute_SHIFT_CTRL;
  assign _zz_VexRiscv_3 = decode_BRANCH_CTRL;
  assign _zz_VexRiscv_1 = _zz_VexRiscv_33;
  assign _zz_VexRiscv_20 = decode_to_execute_BRANCH_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (*) begin
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(_zz_VexRiscv_136)
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_VexRiscv_137 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_VexRiscv_137[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_VexRiscv_137[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_VexRiscv_137[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_138 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_VexRiscv_138[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_VexRiscv_138[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_VexRiscv_138[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_139 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_VexRiscv_139[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_VexRiscv_139[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_VexRiscv_139[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_140 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_VexRiscv_140[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_141 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_VexRiscv_141[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_VexRiscv_141[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_142 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_VexRiscv_142[31 : 0] = CsrPlugin_mtval;
    end
  end

  always @ (*) begin
    _zz_VexRiscv_143 = 32'h0;
    if(execute_CsrPlugin_csr_3072)begin
      _zz_VexRiscv_143[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @ (*) begin
    _zz_VexRiscv_144 = 32'h0;
    if(execute_CsrPlugin_csr_3200)begin
      _zz_VexRiscv_144[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  assign execute_CsrPlugin_readData = (((_zz_VexRiscv_137 | _zz_VexRiscv_138) | (_zz_VexRiscv_139 | _zz_VexRiscv_140)) | ((_zz_VexRiscv_141 | _zz_VexRiscv_142) | (_zz_VexRiscv_143 | _zz_VexRiscv_144)));
  assign _zz_VexRiscv_146 = 1'b0;
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h0;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= 32'h0;
      _zz_VexRiscv_51 <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_VexRiscv_79 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      _zz_VexRiscv_109 <= 1'b1;
      execute_LightShifterPlugin_isActive <= 1'b0;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
      _zz_VexRiscv_135 <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_VexRiscv_136 <= 3'b000;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if((decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode)))begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(_zz_VexRiscv_161)begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_VexRiscv_51 <= 1'b0;
      end
      if(_zz_VexRiscv_49)begin
        _zz_VexRiscv_51 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if((IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if((IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_VexRiscv_171)begin
        if(IBusSimplePlugin_decompressor_bufferFill)begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if((IBusSimplePlugin_externalFlush || IBusSimplePlugin_decompressor_consumeCurrent))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        _zz_VexRiscv_79 <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready)begin
        _zz_VexRiscv_79 <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if((! 1'b0))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_VexRiscv_211);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_VexRiscv_213);
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)));
        `else
          if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)));
        `else
          if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_VexRiscv_172)begin
        if(_zz_VexRiscv_173)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_VexRiscv_174)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_VexRiscv_175)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_VexRiscv_157)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_VexRiscv_158)begin
        case(_zz_VexRiscv_160)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_VexRiscv_94,{_zz_VexRiscv_93,_zz_VexRiscv_92}} != 3'b000) || CsrPlugin_thirdPartyWake);
      _zz_VexRiscv_109 <= 1'b0;
      if(_zz_VexRiscv_154)begin
        if(_zz_VexRiscv_176)begin
          execute_LightShifterPlugin_isActive <= 1'b1;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= 1'b0;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= 1'b0;
      end
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_VexRiscv_170)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[18])begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[26])begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          default : begin
          end
        endcase
      end
      if(_zz_VexRiscv_155)begin
        if(_zz_VexRiscv_156)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_VexRiscv_159)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_VexRiscv_135 <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(_zz_VexRiscv_136)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid)begin
            _zz_VexRiscv_136 <= 3'b001;
          end
        end
        3'b001 : begin
          _zz_VexRiscv_136 <= 3'b010;
        end
        3'b010 : begin
          _zz_VexRiscv_136 <= 3'b011;
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_VexRiscv_136 <= 3'b100;
          end
        end
        3'b100 : begin
          _zz_VexRiscv_136 <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_VexRiscv_231[0];
          CsrPlugin_mstatus_MIE <= _zz_VexRiscv_232[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_VexRiscv_234[0];
          CsrPlugin_mie_MTIE <= _zz_VexRiscv_235[0];
          CsrPlugin_mie_MSIE <= _zz_VexRiscv_236[0];
        end
      end
    end
  end

  always @ (posedge clk) begin
    if(IBusSimplePlugin_decompressor_input_valid)begin
      IBusSimplePlugin_decompressor_bufferValidLatch <= IBusSimplePlugin_decompressor_bufferValid;
    end
    if(IBusSimplePlugin_decompressor_input_valid)begin
      IBusSimplePlugin_decompressor_throw2BytesLatch <= IBusSimplePlugin_decompressor_throw2Bytes;
    end
    if(_zz_VexRiscv_171)begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready)begin
      _zz_VexRiscv_80 <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_VexRiscv_81 <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_VexRiscv_82 <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_VexRiscv_83 <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(_zz_VexRiscv_172)begin
      if(_zz_VexRiscv_173)begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_VexRiscv_174)begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(_zz_VexRiscv_175)begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(_zz_VexRiscv_157)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if(_zz_VexRiscv_154)begin
      if(_zz_VexRiscv_176)begin
        execute_LightShifterPlugin_amplitudeReg <= (execute_LightShifterPlugin_amplitude - 5'h01);
      end
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_VexRiscv_44;
    end
    _zz_VexRiscv_134 <= debug_bus_cmd_payload_address[2];
    if(_zz_VexRiscv_155)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_VexRiscv_23;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_VexRiscv_45;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_VexRiscv_18;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_VexRiscv_15;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_VexRiscv_13;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_VexRiscv_11;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_VexRiscv_8;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_VexRiscv_5;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_VexRiscv_2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_VexRiscv_26;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_VexRiscv_24;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if(((! memory_arbitration_isStuck) && (! execute_arbitration_isStuckByOthers)))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_VexRiscv_40;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_VexRiscv_21;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((_zz_VexRiscv_136 != 3'b000))begin
      _zz_VexRiscv_82 <= IBusSimplePlugin_injectionPort_payload;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3072 <= (decode_INSTRUCTION[31 : 20] == 12'hc00);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3200 <= (decode_INSTRUCTION[31 : 20] == 12'hc80);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_VexRiscv_233[0];
      end
    end
    if(execute_CsrPlugin_csr_833)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end


endmodule

module FlowCCByToggle (
  input               io_input_valid,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment,
  output              io_output_valid,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment,
  input               tck,
  input               clk,
  input               reset
);
  wire                inputArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  reg                 inputArea_target = 0;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_regNext_valid;
  reg                 outputArea_flow_regNext_payload_last;
  reg        [0:0]    outputArea_flow_regNext_payload_fragment;

  BufferCC inputArea_target_buffercc (
    .io_dataIn     (inputArea_target                      ), //i
    .io_dataOut    (inputArea_target_buffercc_io_dataOut  ), //o
    .clk           (clk                                   ), //i
    .reset         (reset                                 )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_regNext_valid;
  assign io_output_payload_last = outputArea_flow_regNext_payload_last;
  assign io_output_payload_fragment = outputArea_flow_regNext_payload_fragment;
  always @ (posedge tck) begin
    if(io_input_valid)begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @ (posedge clk) begin
    outputArea_hit <= outputArea_target;
    outputArea_flow_regNext_payload_last <= outputArea_flow_payload_last;
    outputArea_flow_regNext_payload_fragment <= outputArea_flow_payload_fragment;
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      outputArea_flow_regNext_valid <= 1'b0;
    end else begin
      outputArea_flow_regNext_valid <= outputArea_flow_valid;
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               clk,
  input               reset
);
  wire                _zz_StreamFifoLowLatency_4;
  wire       [0:0]    _zz_StreamFifoLowLatency_5;
  reg                 _zz_StreamFifoLowLatency_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [32:0]   _zz_StreamFifoLowLatency_2;
  reg        [32:0]   _zz_StreamFifoLowLatency_3;

  assign _zz_StreamFifoLowLatency_4 = (! empty);
  assign _zz_StreamFifoLowLatency_5 = _zz_StreamFifoLowLatency_2[0 : 0];
  always @ (*) begin
    _zz_StreamFifoLowLatency_1 = 1'b0;
    if(pushing)begin
      _zz_StreamFifoLowLatency_1 = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_StreamFifoLowLatency_2 = _zz_StreamFifoLowLatency_3;
  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4)begin
      io_pop_payload_error = _zz_StreamFifoLowLatency_5[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_StreamFifoLowLatency_4)begin
      io_pop_payload_inst = _zz_StreamFifoLowLatency_2[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge clk) begin
    if(_zz_StreamFifoLowLatency_1)begin
      _zz_StreamFifoLowLatency_3 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               clk,
  input               reset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge clk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule
