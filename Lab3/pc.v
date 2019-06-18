`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab1 IF/ID
// Date		: January 20, 2019
// Title	: pc.v
// Description	: This module sets the intial value of PC to 0 at start.
//		  When a new npc value is encountered, PC is assigned the 
//		  value of NPC. 

module pc ( 
 	output reg [31:0] PC,             
   	input wire [31:0] npc             
   	);

	initial begin
      		PC <= 0;
   	end
   
	always @ ( npc) begin
      		#1 PC <= npc;
   	end

endmodule 