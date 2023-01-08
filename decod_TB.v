`timescale 1ns / 1ps
module decod_TB;
reg en;
reg A, B;
wire Y3, Y2, Y1, Y0;
// Disponibilizando o DUT(Device-Under-Test)
decodificador_2_4 DUT(Y3, Y2, Y1, Y0, A, B, en);

initial
 begin
     A = 1'b0; // tempo = 0ns
     B = 1'b0; // tempo = 0ns
	  en = 1'b1;// tempo = 0ns
   #10;
     A = 1'b0;
     B = 1'b0; 
   #10;
     A = 1'b1;
     B = 1'b0;
   #15;
     A = 1'b0;
     B = 1'b1; 
   #20;
     A = 1'b1;
     B = 1'b1;
   #15;
     A = 1'b0;
     B = 1'b0;
   #30;
     A = 1'b1;
     B = 1'b1; 
   #25;
     A = 1'b1;
     B = 1'b0;
   #30;
     A = 1'b1;
     B = 1'b1; 
   #15 
	  en = 1'b0;
   #30;
     A = 1'b0;
     B = 1'b0; 
   #50 $stop;
 end
always @(A or B or en)
    begin
       $display("tempo = %t",$time," enable = %b",en);
       $display("A = %b B = %b Y = %b%b%b%b",A,B,Y3,Y2,Y1,Y0);
    end
endmodule
