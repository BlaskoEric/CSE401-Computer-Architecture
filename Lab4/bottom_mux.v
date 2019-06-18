`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab3 EX/MEN
// Date		: Feburary 21, 2019
// Title	: bottom_mux.v 
// Description	: This module is the same as the other mux except that is has
//		  two 5 bit inputs along with a sel. If sel = 0 value of a is
//		  stored, else value of b is stored in y

module bottom_mux(
	output wire [4:0] y,
	input wire [4:0] a,
	input wire [4:0] b,
	input wire sel );

	assign y = sel ? a : b;
endmodule