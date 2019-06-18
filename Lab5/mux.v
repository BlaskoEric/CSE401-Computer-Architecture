`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab1 IF/ID
// Date		: January 20, 2019
// Title	: Mux.v
// Description	: This module takes in 2 32-bit values (A and B) and a 1-bit value
//		  (Sel). If sel is high, value of a is assigned to y, if sel is low
//		  b is assigned to y.

module mux (
	output wire [31:0] y,
	input wire [31:0] a, 
	input wire [31:0] b,
	input wire sel
	);

	assign y = sel ? a : b;
endmodule