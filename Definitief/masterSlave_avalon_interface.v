module masterSlave_avalon_interface(clock, reset, readdata, external_masterSlave);

	input clock, reset,external_masterSlave;
	
	
	output [31:0] readdata;
	wire masterSlaveStatus;
	
	assign readdata = {31'b0, masterSlaveStatus};
	
	
	masterSlave ms(.clock(clock), .reset(reset), .wren(external_masterSlave),
						.in(external_masterSlave), .out(masterSlaveStatus));
	
endmodule 