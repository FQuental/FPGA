module decodificador_2_4 (Y3, Y2, Y1, Y0, A, B, en);

output Y3, Y2, Y1, Y0;
input A, B;
input en;

reg Y3, Y2, Y1, Y0;

always @(A, B, en)
begin
  if (en == 1'b1)
    case ( {A,B} )
      2'b00:   {Y3,Y2,Y1,Y0} = 4'b1110;
      2'b01:   {Y3,Y2,Y1,Y0} = 4'b1101;
      2'b10:   {Y3,Y2,Y1,Y0} = 4'b1011;
      2'b11:   {Y3,Y2,Y1,Y0} = 4'b0111;
      default: {Y3,Y2,Y1,Y0} = 4'b1111;
    endcase
  else {Y3,Y2,Y1,Y0} = 4'b1111;
end
endmodule
