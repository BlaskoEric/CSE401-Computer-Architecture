`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab2 ID/EX
// Date		: January 29, 2019
// Title	: id_ex.v
// Description	: This module is the latch that connects stage 2 to
//		  stage 3 of the MIPS pipeline. The values decoded
//		  are passed to the execution section where the ALU
//		  will handle logical calculations. 

module id_ex(
	input	wire 	[1:0]	ctlwb_out,
	input	wire 	[2:0]	ctlm_out,
	input	wire 	[3:0]	ctlex_out,
	input	wire 	[31:0]	npc, readdat1, readdat2, signext_out,
	input	wire	[4:0]	instr_2016, instr_1511,
	output	reg	[1:0]	wb_ctlout,
	output	reg	[2:0]	m_ctlout,
	output	reg		regdst, alusrc,
	output	reg	[1:0]	aluop, 
	output	reg 	[31:0]	npcout, rdata1out, rdata2out, s_extendout,
	output	reg	[4:0]	instrout_2016, instrout_1511
 );
		
initial begin
  	wb_ctlout <= 2'b0;
	m_ctlout <= 3'b0;
	regdst <= 1'b0;
	aluop <= 2'b0;
	alusrc <= 1'b0;
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
	regdst <= ctlex_out[3];
	aluop <= ctlex_out[2:1];
	alusrc <= ctlex_out[0];
	npcout <= npc;
	rdata1out <= readdat1;
	rdata2out <= readdat2;
	s_extendout <= signext_out;
	instrout_2016 <= instr_2016;
	instrout_1511 <= instr_1511; 

end

//		initial begin
//		$display("Time\t WB\t M\t EX\t NPCout\t rdata1\t rdata2\t sign_e\t in2016\t in1211"); 
//		$monitor("%0d\t %0b\t %0b\t %0b\t %0d\t %0d\t %0d\t %0d\t %0d\t %0d\t",
//			$time, ctlwb_out, ctlm_out, ctlex_out, npc, readdat1, readdat2, signext_out, instr_2016, instr_1511); 
//		#20 $finish;
//		end	
endmodule