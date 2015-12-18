`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:07 06/04/2015 
// Design Name: 
// Module Name:    keymem 
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
module keymem(
	 output reg [127:0] dout,
	 input [3:0] add,
	 input clock,
	 input en
    );
	 
	 reg [127:0] memkey [0:15];			// 11 round keys. 0 is the original key. Index 11 to 15 is BS.
	 
	 initial begin
		$readmemh("roundkeys.table", memkey, 0, 15);
	 end
	 
	 always @(posedge clock) begin
		if(en) begin
			dout <= memkey[add];
		end
	 end
	
endmodule
