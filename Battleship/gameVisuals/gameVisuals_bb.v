
module gameVisuals (
	clk_clk,
	gameboardinfo_data_out,
	gameboardinfo_address,
	gameboardinfo_data_in,
	gameboardinfo_wren,
	reset_reset_n);	

	input		clk_clk;
	output	[31:0]	gameboardinfo_data_out;
	input	[7:0]	gameboardinfo_address;
	input	[31:0]	gameboardinfo_data_in;
	input		gameboardinfo_wren;
	input		reset_reset_n;
endmodule
