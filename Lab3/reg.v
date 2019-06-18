`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab2 ID/EX
// Date		: January 29, 2019
// Title	: reg.v
// Description	: This module holds the values of the 32 registers.
//		  Initially each register is set to 0. When new values
//		  are recieved, the rs, rt, or rd registers will be 
//		  updated with new values

module register (
	input [4:0] rs,
	input [4:0] rt,
	input [4:0] rd,
	input [31:0] writedata,
	input regwrite,
	output reg [31:0] A,
	output reg [31:0] B );

	reg [31:0] REG [0:31];

	integer i;

	initial begin
		A <= 0;
		B <= 0;
		for (i = 0; i < 32; i = i + 1)
			REG[i] <= 0;
	end

	always@ * begin
		A <= REG[rs];
		B <= REG[rt];

		if ((rd!=0) & (regwrite==1))
			REG[rd] <= writedata;
	end
endmodule