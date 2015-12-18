`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:08:07 06/04/2015
// Design Name:   keymem
// Module Name:   F:/Projects/Xilinx/Rijndael/test_memkey.v
// Project Name:  Rijndael
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: keymem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_memkey;

	// Inputs
	reg [3:0] add;
	reg clock;
	reg en;

	// Outputs
	wire [127:0] dout;

	// Instantiate the Unit Under Test (UUT)
	keymem uut (
		.dout(dout), 
		.add(add), 
		.clock(clock), 
		.en(en)
	);
	
	always begin
		clock = 0;
		#10;
		clock = 1;
		#10;
	end
	

	initial begin
		// Initialize Inputs
		add = 0;
		en = 1;
		
      #20 add = add + 1; 
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;

		#20 add = add + 1; 
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;
		#20 add = add + 1;

	end
      
endmodule

