`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:21:22 06/01/2015
// Design Name:   subBytesAll
// Module Name:   F:/Projects/Xilinx/Rijndael/test_subbytesall.v
// Project Name:  Rijndael
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: subBytesAll
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_subbytesall;

	// Inputs
	reg [127:0] subIn;
	reg clk;
	reg inverse;

	// Outputs
	wire [127:0] subOut;

	// Instantiate the Unit Under Test (UUT)
	subBytesAll uut (
		.subOut(subOut), 
		.subIn(subIn), 
		.clk(clk), 
		.inverse(inverse)
	);
	
	always begin
		clk = 0;
		#10;
		clk = 1;
		#10;
	end

	initial begin
		// Initialize Inputs
		subIn = 128'h00102030405060708090a0b0c0d0e0f0;
		inverse = 0;

		// Wait 100 ns for global reset to finish
		#10
		
		#20 subIn = 128'h89d810e8855ace682d1843d8cb128fe4;
		#20 subIn = 128'h4915598f55e5d7a0daca94fa1f0a63f7;
		#20 subIn = 128'hfa636a2825b339c940668a3157244d17;
		#20 subIn = 128'h247240236966b3fa6ed2753288425b6c;
		#20 subIn = 128'hc81677bc9b7ac93b25027992b0261996;

		
		// Add stimulus here

	end
      
endmodule

