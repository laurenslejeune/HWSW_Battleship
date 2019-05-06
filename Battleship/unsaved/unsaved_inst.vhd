	component unsaved is
		port (
			clk_clk          : in  std_logic                     := 'X';             -- clk
			reset_reset_n    : in  std_logic                     := 'X';             -- reset_n
			conduit_address  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			conduit_data_out : out std_logic_vector(31 downto 0);                    -- data_out
			conduit_data_in  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data_in
			conduit_wren     : in  std_logic                     := 'X'              -- wren
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			clk_clk          => CONNECTED_TO_clk_clk,          --     clk.clk
			reset_reset_n    => CONNECTED_TO_reset_reset_n,    --   reset.reset_n
			conduit_address  => CONNECTED_TO_conduit_address,  -- conduit.address
			conduit_data_out => CONNECTED_TO_conduit_data_out, --        .data_out
			conduit_data_in  => CONNECTED_TO_conduit_data_in,  --        .data_in
			conduit_wren     => CONNECTED_TO_conduit_wren      --        .wren
		);

