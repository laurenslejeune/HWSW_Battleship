	battleship u0 (
		.clk_clk                (<connected-to-clk_clk>),                //           clk.clk
		.reset_reset_n          (<connected-to-reset_reset_n>),          //         reset.reset_n
		.gameboardinfo_data_out (<connected-to-gameboardinfo_data_out>), // gameboardinfo.data_out
		.gameboardinfo_address  (<connected-to-gameboardinfo_address>),  //              .address
		.gameboardinfo_data_in  (<connected-to-gameboardinfo_data_in>),  //              .data_in
		.gameboardinfo_wren     (<connected-to-gameboardinfo_wren>),     //              .wren
		.communication_input    (<connected-to-communication_input>),    // communication.input
		.communication_output   (<connected-to-communication_output>),   //              .output
		.masterslave_ismaster   (<connected-to-masterslave_ismaster>)    //   masterslave.ismaster
	);

