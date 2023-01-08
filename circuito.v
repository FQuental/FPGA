module circuito(CLK, CLR, CTRL, Q1, Q2);
input CLK, CLR, CTRL;
output Q1, Q2;

wire W, Y, S;

ffd FFD1(CLR, CLK, W, Q1);
ffd FFD2(CLR, Y, S, Q2);

assign W = Q1 & Q2;
assign S = ~Q2;
assign Y = Q1 ^ CTRL;

endmodule
