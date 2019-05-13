	component battleship is
		port (
			clk_clk                : in  std_logic                     := 'X';             -- clk
			reset_reset_n          : in  std_logic                     := 'X';             -- reset_n
			gameboardinfo_data_out : out std_logic_vector(31 downto 0);                    -- data_out
			gameboardinfo_address  : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			gameboardinfo_data_in  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- data_in
			gameboardinfo_wren     : in  std_logic                     := 'X';             -- wren
			communication_input    : in  std_logic_vector(5 downto 0)  := (others => 'X'); -- input
			communication_output   : out std_logic_vector(5 downto 0);                     -- output
			masterslave_ismaster   : in  std_logic                     := 'X'              -- ismaster
		);
	end component battleship;

	u0 : component battleship
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --           clk.clk
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --         reset.reset_n
			gameboardinfo_data_out => CONNECTED_TO_gameboardinfo_data_out, -- gameboardinfo.data_out
			gameboardinfo_address  => CONNECTED_TO_gameboardinfo_address,  --              .address
			gameboardinfo_data_in  => CONNECTED_TO_gameboardinfo_data_in,  --              .data_in
			gameboardinfo_wren     => CONNECTED_TO_gameboardinfo_wren,     --              .wren
			communication_input    => CONNECTED_TO_communication_input,    -- communication.input
			communication_output   => CONNECTED_TO_communication_output,   --              .output
			masterslave_ismaster   => CONNECTED_TO_masterslave_ismaster    --   masterslave.ismaster
		);

