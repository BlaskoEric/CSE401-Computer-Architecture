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
	output  wire	[3:0]	ex_ctlout,
	output	wire	[31:0]	npcout, 
	output	wire	[31:0]	rdata1out, 
	output	wire	[31:0]	rdata2out, 
	output	wire	[31:0]	s_extendout,
	output	wire	[4:0]	instrout_2016, 
	output 	wire	[4:0]	instrout_1511
	 );

	// signals
	wire [3:0]	ctlex_out;
	wire [2:0]	ctlm_out;
	wire [1:0]	ctlwb_out;
	wire [31:0]	readdat1, readdat2, signext_out;
	
	// instantiations
	control control2 (
		.opcode(IF_ID_instrout[31:26]),
		.ex(ctlex_out),
		.m(ctlm_out),
		.wb(ctlwb_out));
	
	register register2 (
		.rs(IF_ID_instrout[25:21]),
		.rt(IF_ID_instrout[20:16]),
		.rd(MEM_WB_rd),
		.writedata(WB_mux_writedata),
		.regwrite(MEM_WB_regwrite),
		.A(readdat1),
		.B(readdat2));
	
	sign_extend s_extend2 (
		.in(IF_ID_instrout[15:0]),
		.out(signext_out));
	
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
		.ex_ctlout(ex_ctlout),
		.npcout(npcout),
		.rdata1out(rdata1out),
		.rdata2out(rdata2out),
		.s_extendout(s_extendout),
		.instrout_2016(instrout_2016),
		.instrout_1511(instrout_1511));			

		initial begin
		
		$display("Time\t WB\t M\t EX\t NPCout\t rdata1\t rdata2\t sign_e\t in2016\t in1211"); 
		$monitor("%0d\t %0b\t %0b\t %0b\t %0d\t %0d\t %0d\t %0d\t %0d\t %0d\t",
			$time, wb_ctlout, m_ctlout, ex_ctlout, npcout, rdata1out, rdata2out, s_extendout,instrout_2016, instrout_1511); 
		#20 $finish;
		end				
endmodule 