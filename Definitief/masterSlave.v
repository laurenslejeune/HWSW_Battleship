module masterSlave(clock, reset, wren, in, out);

	input clock, reset, wren, in;
	output reg out;
	
	
	always @(posedge clock)
		if (reset == 1'b1)
			out = 1'b0;
		else if(wren ==1'b1)
			out = in;
endmodule 