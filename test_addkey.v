`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:50:59 05/29/2015
// Design Name:   addKey
// Module Name:   F:/Projects/Xilinx/Rijndael/test_addkey.v
// Project Name:  Rijndael
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: addKey
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_addkey;

	// Inputs
	reg [127:0] keyedIn;
	reg [127:0] key;

	// Outputs
	wire [127:0] keyedOut;

	// Instantiate the Unit Under Test (UUT)
	addKey uut (
		.keyedOut(keyedOut), 
		.keyedIn(keyedIn), 
		.key(key)
	);

	initial begin
		// Initialize Inputs
		keyedIn = 128'h046681e5_e0cb199a_48f8d37a_2806264c;
		key = 128'ha0fafe17_88542cb1_23a33939_2a6c7605;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      
endmodule

