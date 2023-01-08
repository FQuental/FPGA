// D flip-flop module sensible to falling edge
// and with asynchronous reset
module ffdAsync (q, nq, d, clk, rst);
// Input list
input wire d, clk, rst;
// Output list
output reg q;
output wire nq;
// Building the inverter output
assign nq = !q;
// Generating the flip-flop
always @(negedge clk, posedge rst) // rising edge and
begin                                // asynchronous rst
	if (rst==1) 
		begin
			q <= 0; 
		end                
	else 
		begin
			q <= d; 
 		end
end
endmodule
