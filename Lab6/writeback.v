`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab5 WB
// Date		: Feburary 21, 2019
// Title	: writeback.v
// Description	: This module is the final module of the MIPS
//		  pipeline. It only contains a mux which can
//		  write data back to the reg in stage 2

module writeback(
	input	wire 		MEM_WB_memtoreg,
	input	wire [31:0]	read_data, mem_alu_result,
	output 	wire [31:0] 	WB_mux_writedata
   	);
	
	mux mux3(
		.y(WB_mux_writedata),
		.sel(MEM_WB_memtoreg),
		.a(read_data),
		.b(mem_alu_result)						
	);

endmodule