`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:18:02 06/09/2015
// Design Name:   aesmodule
// Module Name:   F:/Projects/Xilinx/Rijndael/test_aesmodule.v
// Project Name:  Rijndael
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: aesmodule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_aesmodule;

	// Inputs
	reg [127:0] in;
	reg decr;
	reg clk;
	reg reset;

	// Outputs
	wire [127:0] out;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	aesmodule uut (
		.out(out), 
		.ready(ready), 
		.in(in), 
		.decr(decr), 
		.clk(clk), 
		.reset(reset)
	);
	
	
	always begin
		clk = 0;
		#10; 
		clk = 1;
		#10;
	end

	initial begin
		// Initialize Inputs
		decr = 0;
		reset = 0;
		in = 128'h3243f6a8_885a308d_313198a2_e0370734;
		//in = 128'h3925841d_02dc09fb_dc118597_196a0b32;
		
		#2;
		reset = 1;
		
		#3;
		
		reset = 0;
		
		#5;
		// Add stimulus here

	end
      
endmodule

