`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab1 IF/ID
// Date		: January 20, 2019
// Title	: if_id.v
// Description	: This module takes the next instruction and pc value and 
//		  passes it to the next stage of the MIPS processor. Both
//		  output values are assigned 32 0's to ensure registers are
//		  cleared until the first values come in. 

module if_id (
	output reg [31:0] instrout, npcout, 
   	input wire [31:0] instr, npc
   );

	initial begin
      		instrout <= 32'b0;
      		npcout   <= 32'b0;
   	end
   	always @* begin
      		#1;
		instrout <= instr;
      		npcout <= npc;
   	end
endmodule 