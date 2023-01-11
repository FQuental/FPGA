// Moore FSM to detect sequence 101 using 3 always code blocks
module moore3always (clk, input_bit, rst, state, output_bit);
   	// I/O port list
	input wire clk, input_bit, rst;
	output reg output_bit;
	output wire[1:0] state; 

	// Internal regs
        reg[1:0] current_state, next_state;
        
	// State definition by user
        localparam S0 = 2'd0, S1 = 2'd1, S2 = 2'd2, S3 = 2'd3;

	// Output State definition
	assign state = current_state;

	// Block 3 - Output combinational circuit
        always @ (current_state)
        begin
					 
                case (current_state)
                        S0,S1,S2: output_bit = 1'b0;
                        default: output_bit = 1'b1;
                endcase
        end
	// Block 2 - Sequential circuit
        always @ (posedge clk, posedge rst)
                if (rst) current_state <= S0;
                else current_state <= next_state;   
	// Block 1 - Input sequential circuit
        always @ (*)
                case (current_state)
                        S0: if (input_bit)
                                        next_state <= S1;
                                 else
                                        next_state <= S0;
                        S1: if (input_bit)
                                        next_state <= S1;
                                else
                                        next_state <= S2;
                        S2: if (input_bit)
                                        next_state <= S3;
                                else
                                        next_state <= S0;
                        S3: if (input_bit)
                                        next_state <= S1;
                                else
                                        next_state <= S2;
                endcase                         
endmodule
