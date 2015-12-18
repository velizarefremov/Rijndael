`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:45 06/01/2015 
// Design Name: 
// Module Name:    mixColumnsAll 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mixColumnsAll(
		output [127:0] mixOut,
		input [127:0] mixIn,
		input clk,
		input inverse
    );

	genvar i;

	generate
		for (i=0; i < 4; i=i+1) begin : MIX_COLS
				mixColumns MC(.mixOut(mixOut[(32*i+31):(32*i)]), .mixIn(mixIn[(32*i+31):(32*i)]), .clk(clk), .inv(inverse));
		end
	endgenerate

endmodule