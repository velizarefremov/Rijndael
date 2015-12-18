`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:59:51 06/01/2015 
// Design Name: 
// Module Name:    subBytesAll 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 		USES Block RAMS to Store SubBytes Logic
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module subBytesAll(
		output [127:0] subOut,
		input [127:0] subIn,
		input clk,
		input inverse
    );

	genvar i;

	generate
		for (i=0; i < 16; i=i+1) begin : SUB_BYTES
				subBytes SB(.dout(subOut[(8*i+7):(8*i)]), .add(subIn[(8*i+7):(8*i)]), .clock(clk), .en(1'b1), .invbytes(inverse));
		end
	endgenerate

endmodule
