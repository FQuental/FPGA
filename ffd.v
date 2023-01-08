module ffd (q, d, clk, rst, habilita);
    output q;
    input d, clk, rst, habilita;
    reg q;

    always @(posedge clk, posedge rst) 
      if  (rst == 1'b1)  q <= 1'b0;
      else
          if(habilita == 1'b1) q <= d;
endmodule
