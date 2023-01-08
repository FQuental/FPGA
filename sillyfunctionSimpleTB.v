`timescale 1ns/1ps
//Simple test bench file for the silly function example
module sillyfunctionSimpleTB (); // no I/O ports
reg a,b,c;
wire y;

//Instantiating the device under test (DUT)
//using the port names, not positioning
sillyfunction dut (.a(a), .b(b), .c(c), .y(y));

//Applying input stimulus
initial 
	begin
		a=0; b=0; c=0; #10;//apply inputs, wait 10ns
		c=1; #10;          //apply inputs, wait 10ns
		b=1; c=0; #10;     //apply inputs, wait 10ns
		c=1; #10;          //apply inputs, wait 10ns
		a=1; b=0; c=0; #10;//apply inputs, wait 10ns
		$stop;
	end
endmodule
