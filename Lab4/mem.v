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
		MEM[0] <= 32'h00221820;
		MEM[1] <= 32'h8C220004;
		MEM[2] <= 32'hACC50008;
		MEM[3] <= 32'h10200000;
	//	MEM[0] <= 32'h002300AA;
	//	MEM[1] <= 32'h10654321;
	//	MEM[2] <= 32'h00100022;
	//	MEM[3] <= 32'h8C123456;
	//	MEM[4] <= 32'h8F123456;
	//	MEM[5] <= 32'hAD654321;
	//	MEM[6] <= 32'h13012345;
	//	MEM[7] <= 32'hAC654321;
	//	MEM[8] <= 32'h12012345;
	//	MEM[9] <= 32'hxxxxxxxx;
	end
	
	always @(addr) data <= MEM[addr];
endmodule