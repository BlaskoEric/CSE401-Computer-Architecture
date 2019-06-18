`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab3 EX/MEN
// Date		: Feburary 21, 2019
// Title	: alu_control.v
// Description	: This module sets the select value for the ALU based on the funct
//		  and alu op code. The parameters are deleared to give variables
//		  the proper value, then based on the op code the proper value is
//		  stored in the select output.

module alu_control(
    	input	wire	[5:0]	funct,
    	input	wire	[1:0]	aluop,
    	output	reg	[2:0]	select
    	);
	
	parameter	Rtype	= 2'b10,
			Radd	= 6'b100000,
			Rsub	= 6'b100010,
			Rand	= 6'b100100,
			Ror	= 6'b100101,
			Rslt	= 6'b101010;
	
	parameter	lwsw	= 2'b00,
			Itype	= 2'b01,
			xis	= 6'bXXXXXX;
		
	
	parameter	ALUadd	= 3'b010,
			ALUsub	= 3'b110,
			ALUand	= 3'b000,
			ALUor	= 3'b001,
			ALUslt	= 3'b111;
					
	parameter	unknown	= 2'b11,
			ALUx	= 3'b011;
	
	initial
		select <= 0;
	
	always@* begin
		if (aluop == Rtype)
		begin
			case(funct)
				Radd:	select <= ALUadd;
				Rsub:	select <= ALUsub;
				Rand:	select <= ALUand;
				Ror:	select <= ALUor;
				Rslt:	select <= ALUslt;
				default:select <= ALUx;
			endcase
	    	end
		 
		else if (aluop == lwsw)
       		begin
			select <= ALUadd;
		end
		
		else if (aluop == Itype)
       		begin		
		   	select <= ALUsub;
		end
		
		else if (aluop == unknown)
	    	begin	
   			select <= ALUx;
		end
		
		else
		begin
			select <= select;			
		end	
	end
endmodule  