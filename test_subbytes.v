`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:13:37 05/29/2015
// Design Name:   subBytes
// Module Name:   F:/Projects/Xilinx/Rijndael/test_subbytes.v
// Project Name:  Rijndael
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: subBytes
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_subbytes;

	// Inputs
	reg [7:0] add;
	reg invbytes;

	// Outputs
	wire [7:0] dout;

	// Instantiate the Unit Under Test (UUT)
	subBytes uut (
		.dout(dout), 
		.add(add), 
		.invbytes(invbytes)
	);

	always begin
		#20 add = add + 1;
	end

	initial begin
		// Initialize Inputs
		add = 0;
		invbytes = 0;

		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
      
endmodule

