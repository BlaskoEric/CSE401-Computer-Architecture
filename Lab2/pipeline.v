`include "fetch.v"
`include "decode.v"
`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab2 ID/EX
// Date		: January 29, 2019
// Title	: pipeline.v
// Description	: This module connects all stages of the pipeline together.
//		  until all stages are complete, this module will act as
//		  the testbench to test each stage of the MIPS pipeline.

module pipeline();

  	wire [31:0] IF_ID_instr_wire, IF_ID_npc_wire;
  	wire EX_MEM_PCSrc; // wire EX_MEM_PCSrc;
  	wire [31:0] EX_MEM_NPC; // wire [31:0] EX_MEM_NPC;

   	fetch STAGE1(
		.outInstr(IF_ID_instr_wire),
                .outNpc(IF_ID_npc_wire),
                .sel(0),
                .ex_npc(EX_MEM_NPC) );

	wire	[4:0]	MEM_WB_rd_wire;
	wire		MEM_WB_regwrite_wire;
	wire	[31:0]	WB_mux_writedata_wire;	
	wire	[1:0]	wb_ctlout_wire;
	wire	[2:0]	m_ctlout_wire;
	wire	[3:0]	ex_ctlout_wire;
	wire	[31:0]	npcout_wire; 
	wire	[31:0]	rdata1out_wire; 
	wire	[31:0]	rdata2out_wire;
 	wire	[31:0]	s_extendout_wire;
	wire	[4:0]	instrout_2016_wire; 
	wire	[4:0]	instrout_1511_wire;

	decode STAGE2(
		.IF_ID_instrout(IF_ID_instr_wire),
		.IF_ID_npcout(IF_ID_npc_wire),
		.MEM_WB_rd(MEM_WB_rd_wire),
		.MEM_WB_regwrite(MEM_WB_regwrite_wire),
		.WB_mux_writedata(WB_mux_writedata_wire),
		.wb_ctlout(wb_ctlout_wire),
		.m_ctlout(m_ctlout_wire),
		.ex_ctlout(ex_ctlout_wire),
		.npcout(npcout_wire),
		.rdata1out(rdata1out_wire),
		.rdata2out(rdata2out_wire),
		.s_extendout(s_extendout_wire),
		.instrout_2016(instrout_2016_wire),
		.instrout_1511(instrout_1511_wire));
endmodule