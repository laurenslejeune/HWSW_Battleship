module master_tester (clock, reset, TxD_start, TxD_pin, transmitted_data);

	input clock, reset, TxD_start;
	output TxD_pin;
	output [7:0] transmitted_data;
	async_transmitter transmitter(
	.clk(clock),
	.TxD_start(TxD_start),
	.TxD_data(data),
	.TxD(TxD_pin),
	.TxD_busy()
	);

	wire [7:0] data;
	wire [31:0] counter_output;
	free_running_counter ctr(clk_25,reset,counter_output);
	
	assign data = counter_output[24:17];
	assign transmitted_data = counter_output[24:17];
endmodule 