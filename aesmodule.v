`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:04 06/09/2015 
// Design Name: 
// Module Name:    aesmodule 
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
module aesmodule(
    output [127:0] out,
    output ready,
    input [127:0] in,
	 input decr,
    input clk,
	 input reset
    );

	wire [3:0] memadd;
	wire [127:0] roundkey;
	
	// Main AES Encrypt Block (Encrypts single 128 bit data)
	aesmain mainencblock( .out(out), .ready(ready), .memadd(memadd), .in(in), .roundkey(roundkey), .decr(decr), .clk(clk), .reset(reset));
	
	// Memory
	keymem keymemory(.dout(roundkey), .add(memadd), .clock(clk), .en(1'b1));	// Always enabled, but use a counter for address that has a clock divided by 2. 
	 


endmodule
