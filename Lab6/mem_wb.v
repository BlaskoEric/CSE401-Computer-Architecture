`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab4 MEN/WB
// Date		: Feburary 21, 2019
// Title	: mem_wb.v
// Description	: This module is the latch for the end of the 4th
//		  stage of the MIPS pipeline. it stores the data
//		  from mem stage and passes it to writeback stage
// 		  on the next clock pulse

module mem_wb(
	input	wire	[1:0]	control_wb_in,
	input	wire	[31:0]	read_data_in, alu_result_in,
	input	wire	[4:0]	write_reg_in,
	output	reg		regwrite, memtoreg,
	output	reg	[31:0]	read_data, mem_alu_result,
	output	reg	[4:0]	mem_write_reg
    	);
	
initial begin
	regwrite <= 0;
	memtoreg <= 0;
	read_data <= 0;
	mem_alu_result <= 0;
	mem_write_reg <= 0;
end

always@* begin
	#1;
	regwrite <= control_wb_in[1];
	memtoreg <= control_wb_in[0];
	read_data <= read_data_in;
	mem_alu_result <= alu_result_in;
	mem_write_reg <= write_reg_in;
end
	
//initial begin
//	$display("Time\t regwrite\t memtoreg\t read_data\t mem alu result\t mem write reg"); 
//	$monitor("%0d\t %0b\t\t %0b\t\t %0d\t\t %0d\t\t %0d\t ",
//		$time, regwrite,memtoreg,read_data, mem_alu_result,mem_write_reg ); 
//	#20 $finish;
//end
endmodule 