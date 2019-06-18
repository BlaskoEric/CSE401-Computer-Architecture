`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab4 MEM/WB
// Date		: Feburary 21, 2019
// Title	: data_memory.v
// Description	: This module has 256, 32-bit register. if memread is 1
//		  and memwrite is = read data is set to the memory location
//		  in data memory[addr]. if memread is 0 and memwrite is 1,
//		  the write data is stored at the addr in memory
module data_memory (
	output	reg  	 [31:0]	read_data,
   	input	wire	[31:0]	addr,	
   	input	wire 	[31:0]	write_data,	
   	input	wire		memwrite, memread
	);


   	reg [31:0] DMEM[0:255];

	integer i;
	
	initial begin
		read_data <= 0;
   	
		$readmemb("data.txt",DMEM);
	end
   
   	always@(addr)begin
		if ((memread == 1) && (memwrite == 0))
        		read_data <= DMEM[addr];
		if ((memwrite == 1) && (memwrite == 0))
	            DMEM[addr] <= write_data;
	end
endmodule