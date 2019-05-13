
module gameVisuals (
	clk_clk,
	communication_input,
	communication_output,
	gameboardinfo_data_out,
	gameboardinfo_address,
	gameboardinfo_data_in,
	gameboardinfo_wren,
	reset_reset_n,
	masterslave_ismaster);	

	input		clk_clk;
	input	[5:0]	communication_input;
	output	[5:0]	communication_output;
	output	[31:0]	gameboardinfo_data_out;
	input	[7:0]	gameboardinfo_address;
	input	[31:0]	gameboardinfo_data_in;
	input		gameboardinfo_wren;
	input		reset_reset_n;
	input		masterslave_ismaster;
endmodule
