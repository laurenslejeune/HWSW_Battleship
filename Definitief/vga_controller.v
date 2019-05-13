module vga_controller(clock, reset, display_col, display_row, visible, hsync, vsync); 

	// 72 Hz 800 x 600 VGA - 50MHz clock 
	parameter HOR_FIELD = 799; 
	parameter HOR_STR_SYNC = 855;
	parameter HOR_STP_SYNC = 978; 
	parameter HOR_TOTAL = 1042; 
	
	parameter VER_FIELD = 599; 
	parameter VER_STR_SYNC = 636; 
	parameter VER_STP_SYNC = 642; 
	parameter VER_TOTAL = 665; 

	input clock; 
	input reset; // reset signal 
	
	output reg [11:0] display_col; // horizontal counter 
	output reg [10:0] display_row; // vertical counter 
	output visible; // signal visible on display 
	output hsync, vsync; 
	
	wire line_start_pulse;
	
	//HSYNC teller
	always @(posedge clock)
		if (reset)
			display_col = 0;
		else if (display_col == HOR_TOTAL)
			display_col = 0;
		else
			display_col = display_col + 1;

	//VSYNC teller
	always @(posedge clock)
		if(reset)
			display_row = 0;
		else if(line_start_pulse)
			if(display_row == VER_TOTAL)
				display_row = 0;
			else
				display_row = display_row + 1;
	assign hsync = !((display_col >= HOR_STR_SYNC) & (display_col <= HOR_STP_SYNC));
	assign vsync = !((display_row >= VER_STR_SYNC) & (display_row <= VER_STP_SYNC));
	
	assign visible = (display_col >= 0) & (display_col <= HOR_FIELD)
						  & (display_row >= 0) & (display_row <= VER_FIELD);
	assign line_start_pulse = (display_col == HOR_STR_SYNC);
	
endmodule 