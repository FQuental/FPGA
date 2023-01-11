//Test bench module for the shift register: Notice that the module has no ports
`timescale 1ns/100ps //scale | resolution
module shiftRegtb();
    //Inputs and outputs
    wire[2:0] out;
    reg[2:0] data, sel;
    reg clk, clr, lin, rin; //reg to memorize last value
    // 1 - Device Under Test (DUT) as a component	
      shiftReg DUT (rin, lin, clk, clr, data, sel, out);
    // 2 - Creating the input stimulus
    // clock signal
    always begin
	#15 clk =!clk;  //toogle clk signal
    end                   
    // 3 - Applying the stimulus                      
    initial begin
	//Initialize all inputs
	clk=0;
	data = 3'b001;
 	sel = 3'b001; //load data
	rin = 1;
	lin = 1;
	clr = 0; //clear operation
 	#30 //wait for 100 ns
	//activating shift register
	clr = 1;
	#30
	//rotate to left keeping LSB
	sel = 3'b111;
	#30
	//load data
	sel = 3'b001;
	#30
 	//rotate to right keeping LSB
	sel = 3'b110;
	#30
	//load data
	sel = 3'b001;
	#30 
 	//rotate to left filling with zeros
	sel = 3'b101;
	#30
	//load data
	sel = 3'b001;
	#30 
 	//rotate to right filling with zeros
	sel = 3'b100;
	#30
	//load data
	data = 3'b000; 
	sel = 3'b001;
	#30 
 	//rotate to left filling with lin
	sel = 3'b011;
	#30
        //load data
	data = 3'b000; 
	sel = 3'b001;
	#30 
 	//rotate to left filling with rin
	sel = 3'b010;
	#30 $finish; //states the simulation end at 400ns
    end 
endmodule
