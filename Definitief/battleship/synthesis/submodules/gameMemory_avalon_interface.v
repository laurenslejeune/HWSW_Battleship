module gameMemory_avalon_interface(clock, resetn, writedata, readdata, write, chipselect,
											  address, Q_address, Q_export, Q_wren, Q_input_data);
											  

											  
	// signals for connecting to the Avalon fabric
	input clock, resetn, write, chipselect;
	input [7:0] address;
	input[31:0] writedata;
	output[31:0] readdata;
	
	// signal for exporting register contents outside of the embedded system
	input Q_wren;
	input [7:0] Q_address;
	input [31:0] Q_input_data;
	output[31:0] Q_export;
				
	// Convention:
	// a = Processor (running the C doe)
	// b = Conduit (to the FPGA)
	gameMemory RAM(.clock(clock),
				  .wren_a(write),
				  .wren_b(Q_wren),
				  .address_a(address),
				  .address_b(Q_address),
				  .data_a(writedata),
				  .data_b(Q_input_data),
				  .q_a(readdata),
				  .q_b(Q_export));
	
endmodule 