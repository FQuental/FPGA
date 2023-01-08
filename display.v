//Decoder for two 7-seg display
module display (Entrada, Hex0);
// I/O list
input wire[3:0] Entrada;
output reg [6:0] Hex0;
// Digits and symbols as parameters
localparam zero   = 7'b1000000; //40
localparam um 	   = 7'b1111001; //79
localparam dois   = 7'b0100100; //24
localparam tres 	= 7'b0110000; //30
localparam quatro = 7'b0011001; //19
localparam cinco  = 7'b0010010; //12
localparam seis 	= 7'b0000010; //02
localparam sete 	= 7'b1111000; //78
localparam oito 	= 7'b0000000; //00
localparam nove 	= 7'b0011000; //18
localparam a	   = 7'b0001000; //18
localparam b	   = 7'b0000011; //18
localparam c   	= 7'b1000110; //18
localparam d   	= 7'b0100001; //18
localparam e   	= 7'b0000110; //18
localparam f   	= 7'b0001110; //18



always @ (Entrada) 
	case (Entrada)
	  // Positive values 
          4'b000000: {Hex0} <=  {zero};
          4'b000001: {Hex0} <=  {um};
          4'b000010: {Hex0} <=  {dois};
          4'b000011: {Hex0} <=  {tres};
          4'b000100: {Hex0} <=  {quatro};
          4'b000101: {Hex0} <=  {cinco};
          4'b000110: {Hex0} <=  {seis};
          4'b000111: {Hex0} <=  {sete};
          4'b001000: {Hex0} <=  {oito};
          4'b001001: {Hex0} <=  {nove};
          4'b001010: {Hex0} <=  {a};
          4'b001011: {Hex0} <=  {b};
          4'b001100: {Hex0} <=  {c};
          4'b001101: {Hex0} <=  {d};
          4'b001110: {Hex0} <=  {e};
          4'b001111: {Hex0} <=  {f};
          default:   {Hex0} <=  {zero};
        endcase
endmodule
