`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:19:47 06/01/2015
// Design Name:   shiftRows
// Module Name:   F:/Projects/Xilinx/Rijndael/test_shiftrows.v
// Project Name:  Rijndael
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftRows
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_shiftrows;

	// Inputs
	reg [127:0] shftIn;
	reg inv;

	// Outputs
	wire [127:0] shftOut;

	// Instantiate the Unit Under Test (UUT)
	shiftRows uut (
		.shftOut(shftOut), 
		.shftIn(shftIn), 
		.inv(inv)
	);

	initial begin
		// Initialize Inputs
		inv = 0;
		shftIn = 128'h63cab7040953d051cd60e0e7ba70e18c;
		
		#20 shftIn = 128'ha761ca9b97be8b45d8ad1a611fc97369;
      #20 shftIn = 128'h3b59cb73fcd90ee05774222dc067fb68;
		#20 shftIn = 128'h2dfb02343f6d12dd09337ec75b36e3f0;
		#20 shftIn = 128'h36400926f9336d2d9fb59d23c42c3950;		
		 
		// Add stimulus here

	end
      
endmodule

