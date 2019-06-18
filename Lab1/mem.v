`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab1 IF/ID
// Date		: January 20, 2019
// Title	: Memory
// Description	: This module consist of 128 memory locations of 32-bits.
//		  At first start the first 10 memory location are assigned 
//		  values to represent instructions. When a addr value is 
//		  reseaved, the instruction at that memory location is 
// 		  assigned to the data register.

module mem (
	output reg [31:0] data, 
	input wire [31:0] addr
	);

	reg [31:0] MEM[0:127];
	
	initial begin
		MEM[0] <= 32'hA00000AA;
		MEM[1] <= 32'h10000011;
		MEM[2] <= 32'h20000022;
		MEM[3] <= 32'h30000033;
		MEM[4] <= 32'h40000044;
		MEM[5] <= 32'h50000055;
		MEM[6] <= 32'h60000066;
		MEM[7] <= 32'h70000077;
		MEM[8] <= 32'h80000088;
		MEM[9] <= 32'h90000099;
	end
	
	always @(addr) data <= MEM[addr];
endmodule