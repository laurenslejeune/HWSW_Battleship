
module unsaved (
	clk_clk,
	reset_reset_n,
	conduit_address,
	conduit_data_out,
	conduit_data_in,
	conduit_wren);	

	input		clk_clk;
	input		reset_reset_n;
	input	[7:0]	conduit_address;
	output	[31:0]	conduit_data_out;
	input	[31:0]	conduit_data_in;
	input		conduit_wren;
endmodule
