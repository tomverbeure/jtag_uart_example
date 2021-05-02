	component jtag_uart is
		port (
			av_chipselect  : in  std_logic                     := 'X';             -- chipselect
			av_address     : in  std_logic                     := 'X';             -- address
			av_read_n      : in  std_logic                     := 'X';             -- read_n
			av_readdata    : out std_logic_vector(31 downto 0);                    -- readdata
			av_write_n     : in  std_logic                     := 'X';             -- write_n
			av_writedata   : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			av_waitrequest : out std_logic;                                        -- waitrequest
			clk_clk        : in  std_logic                     := 'X';             -- clk
			irq_irq        : out std_logic;                                        -- irq
			reset_reset_n  : in  std_logic                     := 'X'              -- reset_n
		);
	end component jtag_uart;

	u0 : component jtag_uart
		port map (
			av_chipselect  => CONNECTED_TO_av_chipselect,  --    av.chipselect
			av_address     => CONNECTED_TO_av_address,     --      .address
			av_read_n      => CONNECTED_TO_av_read_n,      --      .read_n
			av_readdata    => CONNECTED_TO_av_readdata,    --      .readdata
			av_write_n     => CONNECTED_TO_av_write_n,     --      .write_n
			av_writedata   => CONNECTED_TO_av_writedata,   --      .writedata
			av_waitrequest => CONNECTED_TO_av_waitrequest, --      .waitrequest
			clk_clk        => CONNECTED_TO_clk_clk,        --   clk.clk
			irq_irq        => CONNECTED_TO_irq_irq,        --   irq.irq
			reset_reset_n  => CONNECTED_TO_reset_reset_n   -- reset.reset_n
		);

