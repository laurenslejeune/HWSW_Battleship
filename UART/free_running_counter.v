module free_running_counter(clock, reset, value);

	input clock, reset;
	output reg [31:0] value;
	
	always @(posedge clock)
		if (reset)
			value = 32'b0;
		else
			if (value == 'hFFFFFFFF)
				value = 32'b0;
			else 
				value = value + 1'b1;

endmodule 