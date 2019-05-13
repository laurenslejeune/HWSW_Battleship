module gameMemory(clock, wren_a, wren_b, address_a, address_b, data_a, data_b, q_a, q_b);

	input clock, wren_a, wren_b;
	input [31:0] data_a, data_b;
	input [7:0] address_a, address_b;
	
	output [31:0] q_a, q_b;

	
	game_RAM RAM(
	
	.address_a(address_a),
	.address_b(address_b),
	.clock(clock),
	.data_a(data_a),
	.data_b(data_b),
	.wren_a(wren_a),
	.wren_b(wren_b),
	.q_a(q_a),
	.q_b(q_b)
	);

endmodule 