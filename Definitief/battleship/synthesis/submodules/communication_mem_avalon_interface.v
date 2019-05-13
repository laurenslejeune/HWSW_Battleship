module communication_mem_avalon_interface(clock, reset, write, writedata, readdata, gpio_in, gpio_out);


	input clock, reset, write;
	
	input  [ 5:0] gpio_in;
	input  [31:0] writedata;
	
	output [ 5:0] gpio_out;
	output [31:0] readdata;
	
	communication_memory mem(.clock(clock), .reset(reset), .write(write), 
									 .data_read(readdata), .data_write(writedata), 
									 .gpio_in(gpio_in), .gpio_out(gpio_out));
endmodule 