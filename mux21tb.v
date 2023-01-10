//Testbench module for the inverter: Notice that the module has no ports
`timescale 1ns/100ps //scale | resolution
module mux21tb(); 
    wire out;
    reg inA, inB, sel; //reg to memorize last value
    
    // 1 - Device Under Test (DUT) as a component	
  muxDataFlow DUT (inA, inB, sel, out); //Dataflow implementation
 // muxStructural DUT (inA, inB, sel, out); //Stuctural implementation  
 // muxBehavioral DUT (inA, inB, sel, out); //Behavioral implementation

    // 2 - Creating the input stimulus
    always begin
		#10 inA =~inA;  //toogle inA signal every 10ns
    end                   
    
	 always begin
		#50 inB =~inB;  //toogle inB signal every 50ns
	 end
	 
	 always begin
		#200 sel =~sel; //toogle sel every 200ns
	 end
    // 3 - Applying the stimulus                      
    initial begin
	//Initialize all 3 inputs
	inA = 0;
	inB = 0;
 	sel = 0;
	//End simulation
	#400 $finish; //states the simulation end at 400ns
    end 
endmodule
