// More FSM to detec 101 sequence using 2 always code blocks
module moore2always (clk, input_bit, rst, state, output_bit);
	// I/O port list
	input wire clk, input_bit, rst;
	output reg output_bit;
	output wire[1:0] state; 
        
	// Internal reg
        reg[1:0] current_state;
        
	// State definition by user
        localparam S0 = 2'd0, S1 = 2'd1, S2 = 2'd2, S3 = 2'd3;

	// Outuput State definition
        assign state = current_state;

	// Block 1 - Combinational output circuit
        always @ (current_state)
        begin
                case (current_state)
                        S0,S1,S2: output_bit = 1'b0;
                        default: output_bit = 1'b1;
                endcase
        end
	// Block 2 - Combinational input circuit + sequential circuit
        always @ (posedge clk, posedge rst)
                if (rst) current_state <= S0;
                else 
                        case (current_state)
                                S0: if (input_bit)
                                    	current_state <= S1;
                                     else
                                        current_state <= S0;
                                S1: if (input_bit)
                                        current_state <= S1;
                                    else
                                        current_state <= S2;
                                S2: if (input_bit)
                                        current_state <= S3;
                                    else
                                        current_state <= S0;
                                S3: if (input_bit)
                                        current_state <= S1;
                                    else
                                        current_state <= S2;
                        endcase                         
endmodule
