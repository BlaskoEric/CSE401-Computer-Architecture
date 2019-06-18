`timescale 1ns / 1ps
`include "fetch.v"
// Name		: Eric Blasko
// Lab		: Lab1 IF/ID
// Date		: January 20, 2019
// Title	: fetch_test.v
// Description	: This test branch test the functionality of the Fetch
//		  stage of the MIPS processor. the first 5 ticks should
//		  display the first five address instruction. after 5
//		  ticks the program counter should return to 2. The 
//		  instructions will continue from there.

module fetch_test;

	reg PCSrc;
	reg [31:0] ex_npc;

	wire[31:0] instr;
	wire[31:0] if_npc;

	fetch fetch1 (
		.sel(PCSrc),
		.ex_npc(ex_npc),
		.outInstr(instr),
		.outNpc(if_npc));

	initial begin
		ex_npc = 0;
		PCSrc = 0;
		#5;
		PCSrc = 1;
		ex_npc = 2;
		#1;
		PCSrc = 0;
		#14;
		$stop;
	end
endmodule