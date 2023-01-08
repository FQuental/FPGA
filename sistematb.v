`timescale 1ns/1ps 
module sistematb ;
	
	reg rst, clk;
	reg [3:0] A, B;
	reg Funcao;
	wire FimA, FimB, FimOp;
	wire [2:0] habilita;
	wire [1:0] estado;
	wire [6:0] Hex1, Hex0;
	
	sistema DUT (.A(A),.B(B),.Funcao(Funcao),.clk(clk),.rst(rst),
	.Hex0(Hex0), .Hex1(Hex1),.habilita(habilita), .estado(estado),
	.sFimA(FimA), .sFimB(FimB), .sFimOp(FimOp));
	
	initial begin
		A = 4'd3;
		B = 4'd5;
		Funcao = 1'b0;
		clk = 1'b0;
		rst = 1'b1;	
		#64   rst = 0;
    #542	A = 4'd1; B = 4'd9;
    #320	A = 4'd7; B = 4'd6;
    #320	B = 4'd3;
	end
	
	always 		#10 	clk = ~clk;

	always		#400 	Funcao = ~Funcao;
	
	initial
	   begin
	     // O simbolo \t indica uma tabulacao"
		  $display("\t\t time,\tclk, rst,\tA,\tB, Funcao,\t\tSaida");
		  $monitor("%d, \t%b, \t%b, \t%d, \t%d,   \t%b,    \t\t%h, \t%h",$time, clk, rst, A, B, Funcao, Hex1, Hex0); 
	   end
	
	initial
		#2400 $stop;
		
endmodule
	
