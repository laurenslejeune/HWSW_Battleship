module slave_tester(clock, RxD, RxD_data_ready, RxD_data);
	
	input clock, RxD;
	output RxD_data_ready;
	output [7:0] RxD_data;
	
	wire RxD_idle, RxD_endofpacket;
	
	async_receiver async_receiver(.clk(clock),
											.RxD(RxD),
											.RxD_data_ready(RxD_data_ready),
											.RxD_data(RxD_data),
											.RxD_idle(RxD_idle),
											.RxD_endofpacket(RxD_endofpacket));
endmodule 