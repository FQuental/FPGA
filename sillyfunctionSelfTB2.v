`timescale 1ns/1ps
//Self-checking test bench file for the silly function example
module sillyfunctionSelfTB();
reg a,b,c; //inputs
wire y;    //output
//Instantiate device under test (DUT)
sillyfunction dut (.a(a), .b(b), .c(c), .y(y));
//Apply inputs
initial
	begin
		a=0; b=0; c=0; #10;//apply inputs, wait 10ns
					if(y!==1) $display("000 failed."); //check
		c=1; #10;          //apply inputs, wait 10ns
              	if(y!==1) $display("001 failed."); //check	
		b=1; c=0; #10;     //apply inputs, wait 10ns
					if(y!==0) $display("010 failed."); //check		
		c=1; #10;          //apply inputs, wait 10ns
					if(y!==0) $display("011 failed."); //check		
		a=1; b=0; c=0; #10;//apply inputs, wait 10ns
					if(y!==0) $display("100 failed."); //check
		$stop;
	end
endmodule
