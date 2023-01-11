module decodDisplay (codigo_BCD, display);
	input      [3:0]   codigo_BCD;
        output reg [6:0]   display;
        // leds acendem com nivel logico 0
        //              leds ->  gfe dcba                  leds ->  gfe dcba
        parameter   branco  = 7'b111_1111; parameter   zero    = 7'b100_0000;
        parameter   um      = 7'b111_1001; parameter   dois    = 7'b010_0100;
        parameter   tres    = 7'b011_0000; parameter   quatro  = 7'b001_1001;
        parameter   cinco   = 7'b001_0010; parameter   seis    = 7'b000_0010;
        parameter   sete    = 7'b111_1000; parameter   oito    = 7'b000_0000;
        parameter   nove    = 7'b001_1000;
        always @(codigo_BCD)
          case(codigo_BCD)
             0:        display = zero;
             1:        display = um;
             2:        display = dois;
             3:        display = tres;
             4:        display = quatro;
             5:        display = cinco;
             6:        display = seis;
             7:        display = sete;
             8:        display = oito;
             9:        display = nove;
             default:  display = branco;
          endcase
endmodule
