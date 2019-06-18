`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab2 ID/EX
// Date		: January 29, 2019
// Title	: id_ex.v
// Description	: This module is the latch that connects stage 2 to
//		  stage 3 of the MIPS pipeline. The values decoded
//		  are passed to the execution section where the ALU
//		  will handle logical calculations. 

module id_ex (
	input wire [1:0] ctlwb_out,
	input wire [2:0] ctlm_out,
	input wire [3:0] ctlex_out,
	input wire [31:0] npc, 
	input wire [31:0] readdat1, 
	input wire [31:0] readdat2, 
	input wire [31:0] signext_out,
	input wire [4:0] instr_2016, 
	input wire [4:0] instr_1511,
	output reg [1:0] wb_ctlout,
	output reg [2:0] m_ctlout,
	output reg [3:0] ex_ctlout,
	output reg [31:0] npcout, 
	output reg [31:0] rdata1out, 
	output reg [31:0] rdata2out, 
	output reg [31:0] s_extendout,
	output reg [4:0] instrout_2016, 
	output reg [4:0] instrout_1511 );

	initial begin
  		wb_ctlout <= 2'b0;
	  	m_ctlout <= 3'b0;
	  	ex_ctlout <= 4'b0;
	  	npcout <= 32'b0;
	  	rdata1out <= 32'b0;  
	  	rdata2out <= 32'b0;
	  	s_extendout <= 32'b0;
		instrout_2016 <= 5'b0; 
		instrout_1511 <= 5'b0; 
	end

	always @ * begin
 		#1;
	 	wb_ctlout <= ctlwb_out;
		m_ctlout <= ctlm_out;
		ex_ctlout <= ctlex_out; 
		npcout <= npc;
		rdata1out <= readdat1;
		rdata2out <= readdat2;
		s_extendout <= signext_out;
		instrout_2016 <= instr_2016;
		instrout_1511 <= instr_1511; 
	end
		
endmodule 