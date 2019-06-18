`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab1 IF/ID
// Date		: January 20, 2019
// Title	: incr.v
// Description	: This module increments the value that is receive from pcin by 1.
//		  This value is then assinged to pcout.

module incr (
	input wire [31:0] pcin, 
	output wire [31:0] pcout
	);

	assign pcout = pcin + 1;
endmodule