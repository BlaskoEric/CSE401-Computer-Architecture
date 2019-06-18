`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: lab3 EX/MEN
// Date		: Feburary 21, 2019
// Title	: adder.v
// Description	: This module takes in two 32 bit inputs, adds them together
//		  and stores the new value in the output register.

module adder(
	output reg [31:0] add_out,
    	input [31:0] add_in1, add_in2
    	); 
	
	always@ * begin
		add_out <= add_in1 + add_in2;
	end
endmodule 