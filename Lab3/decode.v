`include"id_ex.v"
`include"reg.v"
`include"sign_extend.v"
`include"control.v"
`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab2 ID/EX
// Date		: January 29, 2019
// Title	: decode.v
// Description	: This module connects all modules together to complete the
//		  second stage of the MIPS pipeline. The display and monitor
//		  section print the values in the id/ex latch whenever they
//		  are updated.

module decode(
	input	wire  	[31:0]	IF_ID_instrout,
   	input	wire  	[31:0]	IF_ID_npcout,
	input	wire	[4:0]	MEM_WB_rd,
	input	wire		MEM_WB_regwrite,
	input	wire	[31:0]	WB_mux_writedata,
	output	wire	[1:0]	wb_ctlout,
	output	wire	[2:0]	m_ctlout,
	output	wire		regdst, alusrc,
	output	wire	[1:0]	aluop, 
	output	wire	[31:0]	npcout, rdata1out, rdata2out, s_extendout,
	output	wire	[4:0]	instrout_2016, instrout_1511
	 );

	wire [3:0]	ctlex_out;
	wire [2:0]	ctlm_out;
	wire [1:0]	ctlwb_out;
	wire [31:0]	readdat1, readdat2, signext_out;
	
	// instantiations
	control control2(
			.opcode(IF_ID_instrout[31:26]),
			.EX(ctlex_out),
			.M(ctlm_out),
			.WB(ctlwb_out));
	
	register register2(
			.rs(IF_ID_instrout[25:21]),
			.rt(IF_ID_instrout[20:16]),
			.rd(MEM_WB_rd),
			.writedata(WB_mux_writedata),
			.regwrite(MEM_WB_regwrite),
			.A(readdat1),
			.B(readdat2));

	sign_extend s_extend2(
			.nextend(IF_ID_instrout[15:0]),
			.extend(signext_out));
	
	id_ex id_ex2 (
			.ctlwb_out(ctlwb_out),
			.ctlm_out(ctlm_out),
			.ctlex_out(ctlex_out),
			.npc(IF_ID_npcout),
			.readdat1(readdat1),
			.readdat2(readdat2),
			.signext_out(signext_out),
			.instr_2016(IF_ID_instrout[20:16]),
			.instr_1511(IF_ID_instrout[15:11]),
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
endmodule 