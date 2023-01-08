//Silly function module
module sillyfunction (a,b,c,y);
//input list
input wire a,b,c;
//output list
output wire y;
//Dataflow implementation
assign y = ~b & ~c | a & ~b;
endmodule
