// Module operation to control arithmetic operations
module operacao (A,B, clk, rst, Hab, Operacao, Fim, Sinal, Result);
// I/O list
input [3:0] A, B;
input clk, rst, Hab, Operacao;
output reg Fim;
output reg Sinal;
output reg [4:0] Result;
// Internal signals	
reg signed[4:0] tempa, tempb, tempoper;
	
always @ (posedge clk or posedge rst)
begin
	tempa = 0;
    	tempb = 0;
    	tempoper = 0;
	tempa = {1'b0, A};
	tempb = {1'b0, B};
    	if (rst) 
		begin
			Result <= 0;
			Fim <= 0;
			Sinal <= 0;
		end
	else 	
		begin
			if(Hab)
			if(!Fim) 
				begin
					if (~Operacao) 
						begin
							tempoper = tempa + tempb;
							Sinal <= 0;
						end
					else 
						begin
							tempoper = tempa - tempb;
							if (tempoper[4] == 1)
								begin
									tempoper[4:0] = (~tempoper[4:0])  + 5'b1 ; //complemento de 2
									Sinal <= 1;
								end
							else 
								Sinal <= 0;
						end
						Result <= tempoper;
						if (Result == tempoper) 
							Fim <= 1;
						end
						else                   
							Fim <= 0;	
         
     				end
  		end
endmodule	

	
