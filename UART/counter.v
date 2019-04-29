module counter(clock, reset, value, counted);

	input clock, reset;
	input [31:0] value;
	output reg counted;
	
	reg [31:0] internal_counter;

	always @(posedge clock) begin
		if (reset) begin
			internal_counter = 32'b0;
			counted = 1'b0;
			end
		else
			if (internal_counter == value) begin
				internal_counter = 32'b0;
				counted = 1'b1; //1'b0;
				end
			else begin
				internal_counter = internal_counter + 1;
				counted = 1'b0;
			end
	end

endmodule 