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
	 output wire  [31:0] IF_ID_instr,
   output wire  [31:0] IF_ID_npc,
   input  wire         EX_MEM_PCSrc,
   input  wire  [31:0] EX_MEM_NPC
   );
   
	//signals
   wire [31:0] PC;
   wire [31:0] dataout;
   wire [31:0] npc,npc_mux;

	//instantiations
   mux mux1 (
	.y(npc_mux), 
        .a(EX_MEM_NPC), 
        .b(npc), 
        .sel(EX_MEM_PCSrc));
                
   pc pc1 (
	.PC(PC), 
        .npc(npc_mux));
                   
   mem mem1 (
	.data(dataout),
        .addr(PC));
                   
   if_id  if_id1  (
	.instrout(IF_ID_instr),
        .npcout(IF_ID_npc),
        .instr(dataout), 
        .npc(npc));
                   
   incr incrementer1 (
	.pcout(npc), 
        .pcin(PC));
  
  // initial begin
  //    $display("Time\t PC\t npc\t dataout of MEM\t IF_ID_instr\t IF_ID_npc");
  //    $monitor("%0d\t %0d\t %0d\t %h\t %h\t %0d", $time, PC, npc, dataout,IF_ID_instr,IF_ID_npc);
  //    #22 $finish;
  // end                         

endmodule 