// D flip-flop module sensible to falling edge
// and with synchronous reset
module ffdSync (q, nq, d, clk, rst);
// Input list
input wire d, clk, rst;
// Output list
output reg q;
output wire nq;
// Building the inverter output
assign nq = !q;
// Generating the flip-flop
always @(negedge clk) // rising edge and
begin                 // synchronous rst
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
