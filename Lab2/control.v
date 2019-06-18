`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab2 ID/EX
// Date		: January 29, 2019
// Title	: control.v
// Description	: This module reads the 6 bit opcode that comes in
//		  and based its type, ex, m, and wb are assigned there
//		  corisponding values;

module control(
	input wire [5:0] opcode,
	output reg [3:0] ex,
	output reg [2:0] m,
	output reg [1:0] wb );
	
	parameter rtype = 6'b000000;
	parameter lw	= 6'b100011;
	parameter sw	= 6'b101011;
	parameter beq	= 6'b000100;
	parameter nop   = 6'b100000;
	initial begin 
		ex <= 4'b0000;
		m  <= 3'b000;
		wb <= 2'b00;
	end
	
	always@* begin
		case (opcode)
			rtype:	
				begin
					ex <= 4'b1100;
					m  <= 3'b000;
					wb <= 2'b10;
				end
			lw:
				begin
					ex <= 4'b0001;
					m  <= 3'b010;
					wb <= 2'b11;
				end	
			sw:
				begin
					ex <= 4'b0001;
					m  <= 3'b001;
					wb <= 2'b00;
				end
			beq:
				begin
					ex <= 4'b0010;
					m  <= 3'b100;
					wb <= 2'b00;
				end
			nop:	
				begin		
					ex <= 4'b1000;
					m  <= 3'b000;
					wb <= 2'b00;
				end
			default:
				$display ("Opcode not recognized");
		endcase
	end
endmodule