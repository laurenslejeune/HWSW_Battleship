	component gameVisuals is
		port (
			clk_clk                : in  std_logic                     := 'X';             -- clk
			gameboardinfo_data_out : out std_logic_vector(31 downto 0);                    -- data_out
			gameboardinfo_address  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			gameboardinfo_data_in  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data_in
			gameboardinfo_wren     : in  std_logic                     := 'X';             -- wren
			reset_reset_n          : in  std_logic                     := 'X'              -- reset_n
		);
	end component gameVisuals;

	u0 : component gameVisuals
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --           clk.clk
			gameboardinfo_data_out => CONNECTED_TO_gameboardinfo_data_out, -- gameboardinfo.data_out
			gameboardinfo_address  => CONNECTED_TO_gameboardinfo_address,  --              .address
			gameboardinfo_data_in  => CONNECTED_TO_gameboardinfo_data_in,  --              .data_in
			gameboardinfo_wren     => CONNECTED_TO_gameboardinfo_wren,     --              .wren
			reset_reset_n          => CONNECTED_TO_reset_reset_n           --         reset.reset_n
		);

