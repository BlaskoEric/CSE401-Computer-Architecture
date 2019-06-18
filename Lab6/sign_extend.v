`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab2 ID/EX
// Date		: January 29, 2019
// Title	: sign_extend.v
// Description	: This module looks at the last bit which is the 15th bit
//		  position and extends that bit to all of the upper bit
//		  positions. If bit 15 is 1, bits 16-31 will be changed to 
//		  1


module sign_extend(
	input	wire [15:0] nextend,
	output reg [31:0] extend
	);

always@ * 
	begin
		extend <= {{16{nextend[15]}}, nextend[15:0]};
	end
endmodule 