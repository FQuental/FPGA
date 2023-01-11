//BCD counter based on 7493 CI
module cnt(display, leds, clk, rst0, rst1);
//Input list
input  wire clk, rst0, rst1;
//Output list
output wire [6:0] display;
output wire [3:0] leds;
//Internals
wire w_rst_cond; //reset signal name
reg [3:0] intReg; //internal register
assign leds = intReg; //binary value to leds
assign w_rst_cond = (rst0 & rst1); //reset condition
//Creating the counter
always @(negedge clk or posedge w_rst_cond)
begin
	if (w_rst_cond == 1'b1)
		intReg <= 4'b0;
	else
		if (intReg == 4'd9) 
			intReg <= 4'b0;
    		else           
			intReg <= intReg + 1;
end
decodDisplay U1(intReg, display);
endmodule
