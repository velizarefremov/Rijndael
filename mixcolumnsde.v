`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:36:15 06/01/2015 
// Design Name: 
// Module Name:    mixcolumnsde 
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
module mixcolumnsde(
	 output reg [15:0] dout,
	 input [7:0] add,
	 input clock,
	 input en
    );
	 
	 reg [15:0] rom [0:255];			// 15:8 holds subbytes, 7:0 holds invsubbytes.
	 
	 initial begin
		$readmemh("mixcols_d_e.table", rom, 0, 255);
	 end
	 
	 always @(posedge clock) begin
		if(en) begin
			dout <= rom[add];
		end
	 end

endmodule