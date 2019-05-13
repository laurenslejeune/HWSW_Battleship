module communication_memory(clock, reset, write, data_read, data_write, gpio_in, gpio_out);

	input clock, reset, write;
	input [31:0] data_write;
	input [ 5:0] gpio_in;
	
	output [31:0] data_read;
	output [ 5:0] gpio_out;
	
	wire [31:0] connection_read, connection_write;
	
	assign  gpio_out = connection_write[5:0];
	assign  connection_read = {26'b0, gpio_in};
	
	reg32 read_mem(.clock(clock), .reset(reset), .wren(1'b1), .data(connection_read), .q(data_read));
	reg32 write_mem(.clock(clock), .reset(reset), .wren(write), .data(data_write), .q(connection_write));
	

endmodule 