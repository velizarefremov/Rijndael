`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:36:08 06/04/2015 
// Design Name: 
// Module Name:    aesmain 
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
module aesmain(
    output [127:0] out,
    output ready,
	 output [3:0] memadd,
    input [127:0] in,
	 input [127:0] roundkey,
	 input decr,
    input clk,
	 input reset
    );
		
	 wire [127:0] outDec;
	 wire [127:0] outEnc;
	 wire [127:0] shftIn;
	 wire [127:0] shftInDec;
	 wire [127:0] shftInEnc;
	 wire [127:0] shftOut;
	 wire [127:0] mixIn;
	 wire [127:0] mixInDec;
	 wire [127:0] mixInEnc;
	 wire [127:0] mixOut;
	 wire [127:0] stateOut;
	 wire [127:0] stateOutEnc;
	 wire [127:0] stateOutDec;
	 wire [127:0] keyIn;
	 wire [127:0] keyInDec;
	 wire [127:0] keyInEnc;
	 wire [127:0] keyOut;
	 wire [127:0] subIn;
	 wire [127:0] subInDec;
	 wire [127:0] subInEnc;
	 wire [127:0] subOut;
	 wire [127:0] subaltout;
	 wire [127:0] mixaltout;
	 
	 
	 wire roundinselect;
	 wire suben;
	 wire shften;
	 wire mixen;
	 wire keyen;
	 
	 reg [5:0] ctrlbits;
	 
	 reg [4:0] memaddress;	// Used for memory address
	 wire [4:0] memin;
	 
	 wire [4:0] memaddressrev;
	 
	 always @(posedge clk, posedge reset) begin
			
				if(reset) begin
					memaddress <= 5'b00000;
				end
				else if(memaddress == 5'b10111) 
				begin			
					memaddress <= 5'b00000;
				end
				else begin
					memaddress <= memaddress + 1'b1;
				end

			
	 end
	 
	 assign memaddressrev = 5'b10111 - memaddress;
	 
	 // Control Bit Selection Using Case
	 always @(*) begin
		
		ctrlbits = 6'b000000;
		
		if(decr) begin
			case (memaddressrev)
				5'b00000: ctrlbits = 6'b010000;
				5'b00001: ctrlbits = 6'b000110;
				5'b00010: ctrlbits = 6'b101001;
				5'b00011: ctrlbits = 6'b000110;
				5'b00100: ctrlbits = 6'b101001;
				5'b00101: ctrlbits = 6'b000110;
				5'b00110: ctrlbits = 6'b101001;
				5'b00111: ctrlbits = 6'b000110;
				5'b01000: ctrlbits = 6'b101001;
				5'b01001: ctrlbits = 6'b000110;
				5'b01010: ctrlbits = 6'b101001;
				5'b01011: ctrlbits = 6'b000110;
				5'b01100: ctrlbits = 6'b101001;
				5'b01101: ctrlbits = 6'b000110;
				5'b01110: ctrlbits = 6'b101001;
				5'b01111: ctrlbits = 6'b000110;
				5'b10000: ctrlbits = 6'b101001;
				5'b10001: ctrlbits = 6'b000110;
				5'b10010: ctrlbits = 6'b101001;
				5'b10011: ctrlbits = 6'b000110;
				5'b10100: ctrlbits = 6'b101000;
				5'b10101: ctrlbits = 6'b000010;
				
				default: ctrlbits = 6'b000000;
			endcase
		end
		else begin
			case (memaddress)
				5'b00010: ctrlbits = 6'b100001;
				5'b00011: ctrlbits = 6'b001100;
				5'b00100: ctrlbits = 6'b100011;
				5'b00101: ctrlbits = 6'b001100;
				5'b00110: ctrlbits = 6'b100011;
				5'b00111: ctrlbits = 6'b001100;
				5'b01000: ctrlbits = 6'b100011;
				5'b01001: ctrlbits = 6'b001100;
				5'b01010: ctrlbits = 6'b100011;
				5'b01011: ctrlbits = 6'b001100;
				5'b01100: ctrlbits = 6'b100011;
				5'b01101: ctrlbits = 6'b001100;
				5'b01110: ctrlbits = 6'b100011;
				5'b01111: ctrlbits = 6'b001100;
				5'b10000: ctrlbits = 6'b100011;
				5'b10001: ctrlbits = 6'b001100;
				5'b10010: ctrlbits = 6'b100011;
				5'b10011: ctrlbits = 6'b001100;
				5'b10100: ctrlbits = 6'b100011;
				5'b10101: ctrlbits = 6'b001100;
				5'b10110: ctrlbits = 6'b010000;
				
				default: ctrlbits = 6'b000000;
			endcase
		end

	 end

	 // Control Signals
	 assign roundinselect = ctrlbits[5];
	 assign ready = ctrlbits[4];
	 assign shften = (decr)?(ctrlbits[3]):(ctrlbits[2]);
	 assign suben = (decr)?(ctrlbits[2]):(ctrlbits[3]);
	 assign keyen = (decr)?(ctrlbits[1]):(ctrlbits[0]);
	 assign mixen = (decr)?(ctrlbits[0]):(ctrlbits[1]);

	 // Datapath Muxes and Datapath Units
	 assign subInDec = (shften)?(shftOut):(shftIn);	// Dec
	 assign subInEnc = (roundinselect)?(stateOut):(in);	// SubBytes Input Selector, either from previous round or external input.
	 assign subIn = (decr)?(subInDec):(subInEnc);	
	
	 // Sub Bytes and Alternate Path Register
	 subBytesAll bytesub(.subOut(subOut), .subIn(subIn), .clk(clk), .inverse(decr) ); // For now just do encryption
	 regparam  #(.SIZE(128)) subalternate (.Q(subaltout), .D(subIn), .clk(clk), .rst(reset), .clken(1'b1));	// Sub Bytes Not Used Register
	 
	 assign shftInDec = (roundinselect)?(stateOut):(in);	// Dec
	 assign shftInEnc = (suben)?(subOut):(subaltout);
	 assign shftIn = (decr)?(shftInDec):(shftInEnc);
	 
	 // Row Shifter - Works both ways
	 shiftRows rowshifter (.shftOut(shftOut), .shftIn(shftIn), .inv(decr)); // For now just do encryption
	 
	 assign mixInDec = (keyen)?(keyOut):(keyIn);		// Dec
	 assign mixInEnc = (shften)?(shftOut):(shftIn);
	 assign mixIn = (decr)?(mixInDec):(mixInEnc);
	 
	 // Mix Columns and Alternate Path Register
	 mixColumnsAll columnmixer(.mixOut(mixOut), .mixIn(mixIn), .clk(clk), .inverse(decr)); // For now just do encryption
	 regparam  #(.SIZE(128)) mixalternate (.Q(mixaltout), .D(mixIn), .clk(clk), .rst(reset), .clken(1'b1));	// Mix Columns Not Used Register
	 
	 assign keyInDec = (suben)?(subOut):(subaltout);	// Dec
	 assign keyInEnc = (mixen)?(mixOut):(mixaltout);
	 assign keyIn = (decr)?(keyInDec):(keyInEnc);
	 
	 // Key Adder - Basic XOR with 128 bits.
	 addKey keyadder(.keyedOut(keyOut), .keyedIn(keyIn), .key(roundkey));	// The same for encryption and decryption. Routing should be different.
	 
	 assign stateOutDec = (mixen)?(mixOut):(mixaltout);	// Dec
	 assign stateOutEnc = (keyen)?(keyOut):(keyIn);
	 assign stateOut = (decr)?(stateOutDec):(stateOutEnc);
	 
	 assign memin = (decr)?(memaddressrev - 1'b1):(memaddress);
	 assign memadd = memin[4:1];
	 
	 // Output Selector
	 assign outDec = mixaltout;	// Dec
	 assign outEnc = keyOut;
	 assign out = (decr)?(outDec):(outEnc);

endmodule
