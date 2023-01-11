// 3-bit shift register with 5 instructions, sensible to rising edge
module shiftReg(rin, lin, clk, clr, data, sel, out);
// Input list         
input wire rin, lin, clk, clr;
input wire[2:0] data, sel;
// Output list
output reg[2:0] out;
reg[2:0] Qinternal;
// Procedural excerpt         
always @(posedge clk or negedge clr) // sensible to rising edge with 
begin                                // asynchronous falling edge clear
	if (clr == 0) 
		Qinternal <= 3'b000;
	else begin
		case ({sel})
			3'b000 :   Qinternal <= Qinternal;
			3'b001 :   Qinternal <= data;
			3'b010 :   Qinternal <= {rin, Qinternal[2:1]}; //conc.
			3'b011 :   Qinternal <= {Qinternal[1:0], lin}; //conc.
			3'b101 :   Qinternal <= {Qinternal[1:0], 1'b0};//conc.
			default:   Qinternal <= Qinternal;
		endcase
	end
	out <= Qinternal;
end
endmodule
