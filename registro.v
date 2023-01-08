// Module register to hold 4-bit words
module registro (In, clk, rst, Hab, Saida, Fim);
// I/O list
input wire [3:0] In;
input wire clk;
input wire rst;
input wire Hab;
output reg [3:0] Saida;
output reg Fim;

always @ ( posedge clk or posedge rst )
begin
	if (rst)
		 begin
			Saida <= 0;
			Fim <= 0;
		  end
	else
		if (Hab)
			begin
				if(!Fim)
					begin
						Saida <= In;
						if (Saida == In)
							Fim <= 1;
					end
			end
		else
			Fim <=0;
			
end
endmodule
