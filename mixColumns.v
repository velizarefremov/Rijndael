`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:34 06/01/2015 
// Design Name: 
// Module Name:    mixColumns 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: MixColumn applied to a single column
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mixColumns(
	 output [31:0] mixOut, // Data Out
	 input [31:0] mixIn,	// Data In
	 input clk, 			// Clock
	 input inv				// Inverse, If 1 do inverse mix columns step.
    );
	 
	 wire [31:0] mixOutInv;
	 wire [31:0] mixOutNorm;
	 
	wire [7:0] s [0:3];		// Input Column
	wire [7:0] c [0:3];		// Output Column
	wire [7:0] cinv [0:3];		// Inverse Output Column

	// Inputs multiplied by 02 and 03.
	reg [7:0] s0_2;
	reg [7:0] s0_3;
	reg [7:0] s1_2;
	reg [7:0] s1_3;
	reg [7:0] s2_2;
	reg [7:0] s2_3;
	reg [7:0] s3_2;
	reg [7:0] s3_3;
	reg [7:0] s0_1;
	reg [7:0] s1_1;
	reg [7:0] s2_1;
	reg [7:0] s3_1;
	
	wire [7:0] s0_9;
	wire [7:0] s0_B;
	wire [7:0] s0_D;
	wire [7:0] s0_E;
	wire [7:0] s1_9;
	wire [7:0] s1_B;
	wire [7:0] s1_D;
	wire [7:0] s1_E;
	wire [7:0] s2_9;
	wire [7:0] s2_B;
	wire [7:0] s2_D;
	wire [7:0] s2_E;
	wire [7:0] s3_9;
	wire [7:0] s3_B;
	wire [7:0] s3_D;
	wire [7:0] s3_E;

	// Bind input to bytes,
	assign {s[0], s[1], s[2], s[3]} = mixIn;
	
	// Mix Columns multipliers.
	// 02	03	01	01
	// 01	02	03	01
	// 01	01	02	03
	// 03	01	01	02
	
	// Bind sx_1, sx_2 and sx_3
	// This is to make encyrption and decryption run with the same clock steps.
	always @(posedge clk) begin
		s0_2 = (s[0] & 8'h80) ? ((s[0] << 1) ^ 8'h1B) : (s[0] << 1);
		s1_2 = (s[1] & 8'h80) ? ((s[1] << 1) ^ 8'h1B) : (s[1] << 1);
		s2_2 = (s[2] & 8'h80) ? ((s[2] << 1) ^ 8'h1B) : (s[2] << 1);
		s3_2 = (s[3] & 8'h80) ? ((s[3] << 1) ^ 8'h1B) : (s[3] << 1);
		
		s0_3 = s0_2 ^ s[0];
		s1_3 = s1_2 ^ s[1];
		s2_3 = s2_2 ^ s[2];
		s3_3 = s3_2 ^ s[3];
		
		s0_1 = s[0];
		s1_1 = s[1];
		s2_1 = s[2];
		s3_1 = s[3];
	end
	
	// Do the xor.
	assign c[0] = s0_2 ^ s1_3 ^ s2_1 ^ s3_1;
	assign c[1] = s0_1 ^ s1_2 ^ s2_3 ^ s3_1;
	assign c[2] = s0_1 ^ s1_1 ^ s2_2 ^ s3_3;
	assign c[3] = s0_3 ^ s1_1 ^ s2_1 ^ s3_2;
	
	// Inverse Mix Columns Multipliers
	//	0E	0B	0D	09
	//	09	0E	0B	0D
	//	0D	09	0E	0B
	//	0B	0D	09	0E
	
	// S0
	mixcolumns9b mix1(.dout({s0_9,s0_B}), .add(s[0]), .clock(clk), .en(1'b1) );
	mixcolumnsde mix2(.dout({s0_D,s0_E}), .add(s[0]), .clock(clk), .en(1'b1) );
	
	// S1
	mixcolumns9b mix3(.dout({s1_9,s1_B}), .add(s[1]), .clock(clk), .en(1'b1) );
	mixcolumnsde mix4(.dout({s1_D,s1_E}), .add(s[1]), .clock(clk), .en(1'b1) );
	
	// S2
	mixcolumns9b mix5(.dout({s2_9,s2_B}), .add(s[2]), .clock(clk), .en(1'b1) );
	mixcolumnsde mix6(.dout({s2_D,s2_E}), .add(s[2]), .clock(clk), .en(1'b1) );
	
	// S3
	mixcolumns9b mix7(.dout({s3_9,s3_B}), .add(s[3]), .clock(clk), .en(1'b1) );
	mixcolumnsde mix8(.dout({s3_D,s3_E}), .add(s[3]), .clock(clk), .en(1'b1) );
	
	
	assign cinv[0] = s0_E ^ s1_B ^ s2_D ^ s3_9;
	assign cinv[1] = s0_9 ^ s1_E ^ s2_B ^ s3_D;
	assign cinv[2] = s0_D ^ s1_9 ^ s2_E ^ s3_B;
	assign cinv[3] = s0_B ^ s1_D ^ s2_9 ^ s3_E;
	
	// Assign output
	assign mixOutNorm = {c[0], c[1], c[2], c[3]};
	assign mixOutInv = {cinv[0], cinv[1], cinv[2], cinv[3]};

	assign mixOut = (inv)?(mixOutInv):(mixOutNorm);

endmodule
