	jtag_uart u0 (
		.av_chipselect  (<connected-to-av_chipselect>),  //    av.chipselect
		.av_address     (<connected-to-av_address>),     //      .address
		.av_read_n      (<connected-to-av_read_n>),      //      .read_n
		.av_readdata    (<connected-to-av_readdata>),    //      .readdata
		.av_write_n     (<connected-to-av_write_n>),     //      .write_n
		.av_writedata   (<connected-to-av_writedata>),   //      .writedata
		.av_waitrequest (<connected-to-av_waitrequest>), //      .waitrequest
		.clk_clk        (<connected-to-clk_clk>),        //   clk.clk
		.irq_irq        (<connected-to-irq_irq>),        //   irq.irq
		.reset_reset_n  (<connected-to-reset_reset_n>)   // reset.reset_n
	);

