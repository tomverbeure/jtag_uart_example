`default_nettype none

`define JTAG_UART

module top(
        input  wire     clk,
        input  wire     button,
        output reg      led0,
        output reg      led1,
        output reg      led2
    );

    // When changing this value, checkout ./sw/Makefile for a list of 
    // all other files that must be changed as well.
    localparam mem_size_bytes   = 2048;

    // $clog2 is only supported by Verilog-2005 and later.
    // If your synthesis tool doesn't like it, just replace the expression
    // below by 11...
    localparam mem_addr_bits    = $clog2(mem_size_bytes);   

    localparam periph_addr_bits = 12;

    wire                iBus_cmd_valid;
    wire                iBus_cmd_ready;
    wire  [31:0]        iBus_cmd_payload_pc;

    reg                 iBus_rsp_valid;
    wire                iBus_rsp_payload_error;
    reg   [31:0]        iBus_rsp_payload_inst;

    wire                dBus_cmd_valid;
    wire                dBus_cmd_ready;
    wire                dBus_cmd_payload_wr;
    wire  [31:0]        dBus_cmd_payload_address;
    wire  [31:0]        dBus_cmd_payload_data;
    wire  [1:0]         dBus_cmd_payload_size;

    wire                dBus_rsp_ready;
    wire                dBus_rsp_error;
    wire  [31:0]        dBus_rsp_data;

    reg   [7:0]         reset_vec = 8'hff;
    wire                reset;

    // 8 clock cycles of active-high reset.
    always @(posedge clk) begin
        reset_vec       <= { reset_vec[6:0], 1'b0 };     
    end

    assign reset = reset_vec[7];

    VexRiscvTop u_vex (
            .clk                        (clk),
            .reset                      (reset),

            .io_iBus_cmd_valid          (iBus_cmd_valid),
            .io_iBus_cmd_ready          (iBus_cmd_ready),
            .io_iBus_cmd_payload_pc     (iBus_cmd_payload_pc),

            .io_iBus_rsp_valid          (iBus_rsp_valid),
            .io_iBus_rsp_payload_error  (iBus_rsp_payload_error),
            .io_iBus_rsp_payload_inst   (iBus_rsp_payload_inst),

            .io_dBus_cmd_valid          (dBus_cmd_valid),
            .io_dBus_cmd_ready          (dBus_cmd_ready),
            .io_dBus_cmd_payload_wr     (dBus_cmd_payload_wr),
            .io_dBus_cmd_payload_address(dBus_cmd_payload_address),
            .io_dBus_cmd_payload_data   (dBus_cmd_payload_data),
            .io_dBus_cmd_payload_size   (dBus_cmd_payload_size),

            .io_dBus_rsp_ready          (dBus_rsp_ready),
            .io_dBus_rsp_error          (dBus_rsp_error),
            .io_dBus_rsp_data           (dBus_rsp_data),

            .io_timerInterrupt          (1'b0),
            .io_externalInterrupt       (1'b0)
        );

    always @(posedge clk) begin
        iBus_rsp_valid  <= iBus_cmd_valid;
    end

    assign iBus_cmd_ready           = 1'b1;
    assign iBus_rsp_payload_error   = 1'b0;

`ifdef JTAG_UART
    assign dBus_cmd_ready           = jtag_uart_sel ? jtag_uart_dBus_cmd_ready : 1'b1;
`else
    assign dBus_cmd_ready           = 1'b1;
`endif
    assign dBus_rsp_error           = 1'b0;

    wire [31:0] dBus_wdata;
    assign dBus_wdata = dBus_cmd_payload_data;

    wire [3:0] dBus_be;
    assign dBus_be    = (dBus_cmd_payload_size == 2'd0) ? (4'b0001 << dBus_cmd_payload_address[1:0]) : 
                        (dBus_cmd_payload_size == 2'd1) ? (4'b0011 << dBus_cmd_payload_address[1:0]) : 
                                                           4'b1111;

    reg [31:0] mem_rdata;

    wire [3:0] mem_wr;
    assign mem_wr = {4{dBus_cmd_valid && !dBus_cmd_payload_address[31] && dBus_cmd_payload_wr}} & dBus_be;

    // Instead of inferring 1 32-bit wide RAM with 4 byte enables, infer
    // 4 8-bit wide RAMs. Many synthesis tools have issues with inferring RAMs with byte enables. 
    // Quartus, for example, only supports them with SystemVerilog, not
    // regular Verilog.

    reg [7:0] mem0[0:mem_size_bytes/4-1];
    reg [7:0] mem1[0:mem_size_bytes/4-1];
    reg [7:0] mem2[0:mem_size_bytes/4-1];
    reg [7:0] mem3[0:mem_size_bytes/4-1];

    initial begin
        $readmemh("../sw/progmem0.hex", mem0);
        $readmemh("../sw/progmem1.hex", mem1);
        $readmemh("../sw/progmem2.hex", mem2);
        $readmemh("../sw/progmem3.hex", mem3);
    end

    //============================================================
    // CPU memory instruction read port
    //============================================================

    always @(posedge clk) begin 
        iBus_rsp_payload_inst[ 7: 0]  <= mem0[iBus_cmd_payload_pc[mem_addr_bits-1:2]];
        iBus_rsp_payload_inst[15: 8]  <= mem1[iBus_cmd_payload_pc[mem_addr_bits-1:2]];
        iBus_rsp_payload_inst[23:16]  <= mem2[iBus_cmd_payload_pc[mem_addr_bits-1:2]];
        iBus_rsp_payload_inst[31:24]  <= mem3[iBus_cmd_payload_pc[mem_addr_bits-1:2]];
    end

    //============================================================
    // CPU memory data read/write port
    //============================================================

    // Quartus can be very picky about how RTL should structured to infer a true dual-ported RAM...
    always @(posedge clk) begin
        if (mem_wr[0]) begin
            mem0[dBus_cmd_payload_address[mem_addr_bits-1:2]]    <= dBus_wdata[ 7: 0];
            mem_rdata[ 7: 0]  <= dBus_wdata[ 7: 0];
        end
        else 
            mem_rdata[ 7: 0]  <= mem0[dBus_cmd_payload_address[mem_addr_bits-1:2]];

        if (mem_wr[1]) begin
            mem1[dBus_cmd_payload_address[mem_addr_bits-1:2]]    <= dBus_wdata[15: 8];
            mem_rdata[15: 8]  <= dBus_wdata[15: 8];
        end
        else 
            mem_rdata[15: 8]  <= mem1[dBus_cmd_payload_address[mem_addr_bits-1:2]];

        if (mem_wr[2]) begin
            mem2[dBus_cmd_payload_address[mem_addr_bits-1:2]]    <= dBus_wdata[23:16];
            mem_rdata[23:16]  <= dBus_wdata[23:16];
        end
        else 
            mem_rdata[23:16]  <= mem2[dBus_cmd_payload_address[mem_addr_bits-1:2]];

        if (mem_wr[3]) begin
            mem3[dBus_cmd_payload_address[mem_addr_bits-1:2]]    <= dBus_wdata[31:24];
            mem_rdata[31:24]  <= dBus_wdata[31:24];
        end
        else 
            mem_rdata[31:24]  <= mem3[dBus_cmd_payload_address[mem_addr_bits-1:2]];
    end

    //============================================================
    // Non-memory data accesses
    //============================================================

    wire periph_sel;
    assign periph_sel       =  dBus_cmd_valid && (dBus_cmd_payload_address[31:28] == 4'h8);

`ifdef JTAG_UART
    wire jtag_uart_sel;
    assign jtag_uart_sel    =  dBus_cmd_valid && (dBus_cmd_payload_address[31:28] == 4'h9);
`endif

    //============================================================
    // Peripherals
    //============================================================

    reg [31:0]  periph_rdata;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            led0            <= 1'b1;
            led1            <= 1'b1;
            led2            <= 1'b1;
            periph_rdata    <= 32'd0;
        end
        else if (periph_sel) begin

            // LED register
            if (dBus_cmd_payload_address[periph_addr_bits-1:2] == (12'h000 >> 2)) begin
                if (dBus_cmd_payload_wr) begin
                    // LEDs are active low...
                    led0        <= !dBus_wdata[0];
                    led1        <= !dBus_wdata[1];
                    led2        <= !dBus_wdata[2];
                end
                else begin
                    periph_rdata        <= 'd0;
                    periph_rdata[0]     <= !led0;
                    periph_rdata[1]     <= !led1;
                    periph_rdata[2]     <= !led2;
                end
            end

            // Status register
            if (dBus_cmd_payload_address[periph_addr_bits-1:2] == (12'h004 >> 2)) begin
                if (!dBus_cmd_payload_wr) begin
                    periph_rdata[0]     <= button_sync[1];

                    // I don't want to compile different 2 SW version for
                    // simulation and HW, so this status bit can be used by 
                    // the SW on which platform it's running.
`ifdef SIMULATION
                    periph_rdata[1]     <= 1'b1;
`else
                    periph_rdata[1]     <= 1'b0;
`endif

`ifdef JTAG_UART
                    periph_rdata[2]     <= 1'b1;
`else
                    periph_rdata[2]     <= 1'b0;
`endif
                end
            end
        end
    end

    reg periph_rd_done;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            periph_rd_done  <= 1'b0;
        end
        else begin
            // Peripherals don't have a wait state, so rdata is always the
            // cycle after the request.
            periph_rd_done  <= periph_sel && !dBus_cmd_payload_wr;
        end
    end

    reg [1:0] button_sync;

    always @(posedge clk) begin
        // double FF synchronizer
        button_sync <= { button_sync[0], button };
    end

    //============================================================
    // Merge read paths
    //============================================================

    reg mem_rd_done;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            mem_rd_done     <= 1'b0;
        end
        else begin
`ifdef JTAG_UART
            mem_rd_done     <= dBus_cmd_valid && !dBus_cmd_payload_wr && !(periph_sel || jtag_uart_sel);
`else
            mem_rd_done     <= dBus_cmd_valid && !dBus_cmd_payload_wr && !(periph_sel);
`endif
        end
    end

    assign dBus_rsp_ready  = mem_rd_done || periph_rd_done || jtag_uart_rd_done;

    assign dBus_rsp_data = periph_rd_done    ? periph_rdata : 
                           jtag_uart_rd_done ? jtag_uart_rdata :
                                               mem_rdata;

    //============================================================
    // Optional JTAG UART
    //============================================================

    reg         jtag_uart_rd_done;
    reg [31:0]  jtag_uart_rdata;

`ifdef JTAG_UART
    wire        jtag_uart_cs;
    wire        jtag_uart_addr;
    wire        jtag_uart_waitrequest;
    wire        jtag_uart_write;
    wire [31:0] jtag_uart_wdata;
    wire        jtag_uart_read;
    wire [31:0] jtag_uart_readdata;

    wire        jtag_uart_dBus_cmd_ready;

    // JTAG UART has only 2 addresses. Map it to addresses 0x08 and 0x0C
    // Notice how I check the address down to bit 3 instead of bit 2 for 
    // the other registers!
    assign jtag_uart_cs         = jtag_uart_sel;
    assign jtag_uart_addr       = dBus_cmd_payload_address[2];
    assign jtag_uart_read       = !dBus_cmd_payload_wr;
    assign jtag_uart_write      = dBus_cmd_payload_wr;
    assign jtag_uart_wdata      = dBus_cmd_payload_data;

    assign jtag_uart_dBus_cmd_ready = !jtag_uart_waitrequest;

    always @(posedge clk) begin
        jtag_uart_rd_done <= 1'b0;
        if (jtag_uart_cs && jtag_uart_read && !jtag_uart_waitrequest) begin
            jtag_uart_rdata     <= jtag_uart_readdata;
            jtag_uart_rd_done   <= 1'b1;
        end
    end

	jtag_uart u_jtag_uart (
		.clk_clk        (clk),
		.reset_reset_n  (!reset),
		.av_chipselect  (jtag_uart_cs),
		.av_waitrequest (jtag_uart_waitrequest),
		.av_address     (jtag_uart_addr),
		.av_read_n      (!jtag_uart_read),
		.av_readdata    (jtag_uart_readdata),
		.av_write_n     (!jtag_uart_write),
		.av_writedata   (jtag_uart_wdata),
		.irq_irq        ()
	);
`else
    always @(dBus_cmd_valid) begin
        jtag_uart_rd_done = 1'b0;
        jtag_uart_rdata   = 32'd0;
    end
`endif

endmodule

