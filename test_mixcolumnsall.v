`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:50:09 06/01/2015
// Design Name:   mixColumnsAll
// Module Name:   F:/Projects/Xilinx/Rijndael/test_mixcolumnsall.v
// Project Name:  Rijndael
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mixColumnsAll
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mixcolumnsall;

	// Inputs
	reg [127:0] mixIn;
	reg clk;
	reg inverse;

	// Outputs
	wire [127:0] mixOut;

	// Instantiate the Unit Under Test (UUT)
	mixColumnsAll uut (
		.mixOut(mixOut), 
		.mixIn(mixIn), 
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
		inverse = 0;
		mixIn = 128'h6353e08c0960e104cd70b751bacad0e7;
		
		#20 mixIn = 128'ha7be1a6997ad739bd8c9ca451f618b61;
		#20 mixIn = 128'h3bd92268fc74fb735767cbe0c0590e2d;
		#20 mixIn = 128'h2d6d7ef03f33e334093602dd5bfb12c7;
		#20 mixIn = 128'h36339d50f9b539269f2c092dc4406d23;
		
		#100
		
		// Test Inverse MixColumns
		inverse = 1;
		#20 mixIn = 128'hbd6e7c3df2b5779e0b61216e8b10b689;
		#20 mixIn = 128'hfde3bad205e5d0d73547964ef1fe37f1;
		#20 mixIn = 128'hd1876c0f79c4300ab45594add66ff41f;
		#20 mixIn = 128'hc62fe109f75eedc3cc79395d84f9cf5d;
		#20 mixIn = 128'hc81677bc9b7ac93b25027992b0261996;

	end
      
endmodule

