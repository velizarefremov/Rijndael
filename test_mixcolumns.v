`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:39:10 06/01/2015
// Design Name:   mixColumns
// Module Name:   F:/Projects/Xilinx/Rijndael/test_mixcolumns.v
// Project Name:  Rijndael
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mixColumns
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mixcolumns;

	// Inputs
	reg [31:0] mixIn;
	reg inv;

	// Outputs
	wire [31:0] mixOut;

	// Instantiate the Unit Under Test (UUT)
	mixColumns uut (
		.mixOut(mixOut), 
		.mixIn(mixIn), 
		.inv(inv)
	);

	initial begin
		// Initialize Inputs
		
		inv = 0;
		
		mixIn = 32'hd4bf5d30;
		#20 mixIn = 32'he0b452ae;
		#20 mixIn = 32'hb84111f1;
		#20 mixIn = 32'h1e2798e5;
      
		// Add stimulus here

	end
      
endmodule

