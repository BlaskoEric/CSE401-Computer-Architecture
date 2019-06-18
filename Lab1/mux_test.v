`include"mux.v"
`timescale 1ns / 1ps
// Name		: Eric Blasko
// Lab		: Lab1 IF/ID
// Date		: January 20, 2019
// Title	: mux_test.v
// Description	: This module test the functionity of the mux.v module.
//		  values are assigned as inputs with sel being assinged
//		  ether 1 or 0. If sel is 1, A should be returned. If
//		  sel is 0, B should be returned.

module test_mux;
	wire [31:0] Y;
	reg [31:0] A, B;
	reg sel;

	mux mux1 (Y,A,B,sel);

	initial begin
		A = 32'hAAAAAAAA;
		B = 32'h55555555;
		sel = 1'b1;
		#10;
		A = 32'h00000000;
		#10;
		sel = 1'b1;
		#10;
		B = 32'hFFFFFFFF;
		#5;
		A = 32'hA5A5A5A5;
		#5;
		sel = 1'b0;
		B = 32'hDDDDDDDD;
		#5;
		sel = 1'bx;
	end

	always @(A or B or sel)
		#1 $display("At t = %0d sel = %b A = %h B = %h Y = %h",
			$time, sel, A, B, Y);
endmodule