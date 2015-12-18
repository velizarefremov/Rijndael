`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:12 05/29/2015 
// Design Name: 
// Module Name:    addKey 
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
module addKey(
    output [127:0] keyedOut,
    input [127:0] keyedIn,
    input [127:0] key
    );

	 assign keyedOut = (keyedIn ^ key);

endmodule
