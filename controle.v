//FSM to control system operation
module controle (clk, rst, fimA, fimB, fimOp, HabA, HabB, HabOp, estado);
	
//I/O list
input wire clk, rst, fimA, fimB, fimOp;
output reg  HabA, HabB, HabOp;
output wire [1:0] estado;
reg[1:0] E;
	
//States declaration
parameter[1:0] S0 = 0;
parameter[1:0] S1 = 1;
parameter[1:0] S2 = 2;
	
assign estado = E;
	
//Statements,FSM state register, state transition
always @(posedge clk, posedge rst)
	if (rst) E <= S0;
	else 
        	case (E)
         S0:E<=S1;
			S1: if(fimA & fimB)  
				E<=S2;
			    else	     
				E<=S1;
		  	S2: if(fimOp)  
				E<=S0;
			    else	     
				E<=S2;
		endcase

//Generating outputs
always@ (E)
	case (E)
		S0: 
			begin	
				HabA <= 0;
				HabB <= 0;
				HabOp<= 0;
		     	end
		S1:     
			begin
				HabA <= 1;
				HabB <= 1;
				HabOp<= 0;
			end
		S2:     begin
				HabA <= 0;
				HabB <= 0;
				HabOp<= 1;
			end
		endcase	
endmodule
