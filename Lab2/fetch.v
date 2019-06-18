`include "mux.v"
`include "if_id.v"
`include "pc.v"
`include "incr.v"
`include "mem.v"
`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab1 IF/ID
// Date		: January 20, 2019
// Title	: fetch.v
// Description	: This module connects all modules together to complete the
//		  first stage of the MIPS processor. This module also monitors
//		  and displays the changes in the PC, NPC, DATA wires and the
//		  outInstr and outNpc registers 

module fetch (
	input sel,
	input [31:0] ex_npc,
	output [31:0] outInstr,
	output [31:0] outNpc
	);

	wire[31:0] PC;
	wire[31:0] DATA;
	wire[31:0] NPC;
	wire[31:0] NPC_MUX;

	mux mux1(.y(NPC_MUX),
		 .a(ex_npc),
		 .b(NPC),
		 .sel(sel));

	pc pc1(.pc(PC),
	       .npc(NPC_MUX));

	mem mem1(.data(DATA),
		 .addr(PC));

	if_id latch(.npcout(outNpc),
		    .instrout(outInstr),
		    .inst(DATA),
		    .npc(NPC));

	incr incr1(.pcin(PC),
		   .pcout(NPC));

	initial begin

//		$display("Time\t PC\t NPC\t MEM->DATA\t IF_ID_IR\t IF_ID_NPC"); 
//		$monitor("%0d\t %0d\t %0d\t %h\t %h\t %0d",
//			$time,PC,NPC,DATA,outInstr,outNpc);
//		#20 $finish;
	end
endmodule