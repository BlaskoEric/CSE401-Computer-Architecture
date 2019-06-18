`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab3 EX/MEN
// Date		: Feburary 21, 2019
// Title	: adder.v
// Description	: This module is the latch where values from stage 3 of the
//		  MIPS pipleline are stored. These values are stored until the
//		  next clock pulse where the enter stage 4 of the MIPS pipeline

module ex_mem(
	input	wire	[1:0]	ctlwb_out,
	input	wire	[2:0]	ctlm_out,
	input	wire	[31:0]	adder_out,
	input	wire		aluzero,
	input	wire	[31:0]	aluout, readdat2,
	input	wire	[4:0]	muxout,
	output	reg	[1:0]	wb_ctlout,
	output	reg		branch, memread, memwrite,
	output	reg	[31:0]	add_result,
	output	reg		zero,
	output	reg	[31:0]	alu_result, rdata2out,
	output	reg	[4:0]	five_bit_muxout
    );

	initial begin
		wb_ctlout <= 0; 
		branch <= 0; memread <= 0; memwrite <= 0;
		add_result <= 0;
		zero <= 0;
		alu_result <= 0; rdata2out <= 0;
		five_bit_muxout <= 0;
	end

	always@* begin
		#1;
		wb_ctlout <= ctlwb_out;
		branch <= ctlm_out[2];    
		memread <= ctlm_out[1];
		memwrite <= ctlm_out[0]; 
      		add_result <= adder_out;   
		zero <= aluzero;
		alu_result <= aluout;
		rdata2out <= readdat2;
		five_bit_muxout <= muxout;
	end

		initial begin
		$display("Time\t WB\t M\t add_result\t zero\t alu_result\t rdata2out\t 5-bit-muxout\t"); 
		$monitor("%0d\t %0b\t %0b%0b%0b\t %0d\t\t %0d\t %0d\t\t %0d\t\t %0d",
			$time, wb_ctlout,branch,memread,memwrite, add_result,zero,alu_result, rdata2out,five_bit_muxout ); 
		#20 $finish;
		end	
endmodule 