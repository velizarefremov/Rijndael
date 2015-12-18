`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:59:25 05/29/2015 
// Design Name: 
// Module Name:    subBytes 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description:  RAM that contains the sub bytes and invsubbytes table.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module subBytes(
	 output [7:0] dout,
	 input [7:0] add,
	 input clock,
	 input en,
	 input invbytes			// if 1 return inversesub, if 0 return subbytes.
    );
	 
	 reg [15:0] rom [0:255];			// 15:8 holds subbytes, 7:0 holds invsubbytes.
	 
	 reg [15:0] dout_in;
	 
	 initial begin
		$readmemh("subbytes.table", rom, 0, 255);
	 end
	 
	 always @(posedge clock) begin
		if(en) begin
			dout_in <= rom[add];
		end
	 end
	 
	 assign dout = (invbytes)?(dout_in[7:0]):(dout_in[15:8]);

endmodule
