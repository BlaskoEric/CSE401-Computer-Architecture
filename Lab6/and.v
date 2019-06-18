`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab4 MEM/WB
// Date		: Feburary 21, 2019
// Title	: and.v
// Description	: This module ands the membranch and zero and
// 		  assigns it to the PCSrc output wire
module AND(
	input	wire	membranch, zero,
	output	wire	PCSrc
   	);

	assign PCSrc = membranch && zero;

endmodule 