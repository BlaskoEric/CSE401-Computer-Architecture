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
		$readmemb("risc.txt",MEM);
 	end
	
	always @(addr) data <= MEM[addr];
endmodule