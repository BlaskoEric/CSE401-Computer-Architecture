`include "fetch.v"
`include "decode.v"
`include "execute.v"
`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab2 ID/EX
// Date		: January 29, 2019
// Title	: pipeline.v
// Description	: This module connects all stages of the pipeline together.
//		  until all stages are complete, this module will act as
//		  the testbench to test each stage of the MIPS pipeline.

module pipeline();

  	wire 	[31:0] 	IF_ID_instr, IF_ID_npc;
  	wire 		EX_MEM_PCSrc; 
  	wire 	[31:0] 	EX_MEM_NPC; 

   	fetch STAGE1(
		  .IF_ID_instr(IF_ID_instr),
                  .IF_ID_npc(IF_ID_npc),
                  .EX_MEM_PCSrc(0),
                  .EX_MEM_NPC(EX_MEM_NPC) );

	wire	[4:0]	MEM_WB_rd;
	wire		MEM_WB_regwrite;
	wire	[31:0]	WB_mux_writedata;	
	wire	[1:0]	wb_ctlout;
	wire	[2:0]	m_ctlout;
	wire		regdst, alusrc;
	wire	[1:0]	aluop; 
	wire	[31:0]	npcout, rdata1out, rdata2out, s_extendout;
	wire	[4:0]	instrout_2016, instrout_1511;

	decode STAGE2(
		.IF_ID_instrout(IF_ID_instr),
		.IF_ID_npcout(IF_ID_npc),
		.MEM_WB_rd(MEM_WB_rd),
		.MEM_WB_regwrite(MEM_WB_regwrite),
		.WB_mux_writedata(WB_mux_writedata),
		.wb_ctlout(wb_ctlout),
		.m_ctlout(m_ctlout),
		.regdst(regdst),
		.alusrc(alusrc),
		.aluop(aluop),
		.npcout(npcout),
		.rdata1out(rdata1out),
		.rdata2out(rdata2out),
		.s_extendout(s_extendout),
		.instrout_2016(instrout_2016),
		.instrout_1511(instrout_1511));
						
	wire	[1:0]	wb_ctlout_pipe;
	wire		branch, memread, memwrite;
	wire		zero;
	wire	[31:0]	alu_result, rdata2out_pipe;
	wire	[4:0]	five_bit_muxout;
	
	execute STAGE3(
		.wb_ctl(wb_ctlout),
		.m_ctl(m_ctlout),
		.regdst(regdst),
		.alusrc(alusrc),
		.aluop(aluop),
		.npcout(npcout),
		.rdata1(rdata1out),
		.rdata2(rdata2out),
		.s_extendout(s_extendout),
		.instrout_2016(instrout_2016),
		.instrout_1511(instrout_1511),
		.wb_ctlout(wb_ctlout_pipe),
		.branch(branch), 
		.memread(memread), 
		.memwrite(memwrite),
		.zero(zero),
		.alu_result(alu_result),
		.rdata2out(rdata2out_pipe),
		.add_result(EX_MEM_NPC),
		.five_bit_muxout(five_bit_muxout));
endmodule