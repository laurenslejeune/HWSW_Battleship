
module battleship (
	clk_clk,
	reset_reset_n,
	gameboardinfo_data_out,
	gameboardinfo_address,
	gameboardinfo_data_in,
	gameboardinfo_wren,
	communication_input,
	communication_output,
	masterslave_ismaster);	

	input		clk_clk;
	input		reset_reset_n;
	output	[31:0]	gameboardinfo_data_out;
	input	[7:0]	gameboardinfo_address;
	input	[31:0]	gameboardinfo_data_in;
	input		gameboardinfo_wren;
	input	[5:0]	communication_input;
	output	[5:0]	communication_output;
	input		masterslave_ismaster;
endmodule
