// A 2x1 mux module using behavioral abstraction level
module muxBehavioral (a, b, sel, z);
input  wire a, b, sel; // Direction | Data type
output  reg z;         // Direction | Data type

// Using always block to build combinational logic
// 1-All inputs must comprise the the sensitivity list
// 2-Blocking statements may be used
always@(a, b, sel) 		   
	begin
		if (sel == 1'b0)
			z = a; //Blocking statement
		else
			z = b; //Blocking statement
	end
endmodule
