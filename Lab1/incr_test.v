`include "incr.v"
`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab1 IF/ID
// Date		: January 20, 2019
// Title	: incr_test.v
// Description	: This module test the functionity of the incr.v module.
//		  it assigns values that is passed to incr.v and records
//		  the output values which should be incremented by 1.

module insr_test;
	wire [31:0] IncrOut;
	reg [31:0] A;

	incr incr1 (A, IncrOut);

	initial begin
		#10;
		A = 3;
		#10;
		A = 15;
		#10;
		A = 64;
		#5;
	end

	always @(A)
		#1 $display("At t = %0d A = %0d IncrOut = %0d",
			$time, A, IncrOut);
endmodule