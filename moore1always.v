//Moore FSM to detect the sequence 101 using 1 always code block
module moore1always (clk, input_bit, rst, state, output_bit);
	// I/O  port list
	input wire clk, input_bit, rst;
	output reg output_bit; 
	output [1:0] state;
        
	// Internal reg
        reg[1:0] current_state;
   
	// State definition by user
        localparam S0 = 2'd0, S1 = 2'd1, S2 = 2'd2, S3 = 2'd3;
	
	//Output state definition
		  assign state = current_state;
		  
	// Single always code block to describe the whole circuit
        always @ (posedge clk, posedge rst)
                if (rst) begin			//Reset condition
                           output_bit = 1'b0;
                           current_state <= S0;
                         end
                else 
                        case (current_state)//Each state is a single case
										S0: begin
													output_bit = 1'b0; //State output
                                    	if (input_bit)     // Input analysis
                                    		current_state <= S1; //next_state
                                        else                        
                                                current_state <= S0; //next_state
                                    end
                               S1: begin
                                    	output_bit = 1'b0; 
                                      	if (input_bit)
                                        	current_state <= S1;
                                        else
                                        	current_state <= S2;
                                    end
                               S2: begin
                                      output_bit = 1'b0;
                                      if (input_bit)
                                      		current_state <= S3;
                                      else
                                                current_state <= S0;
                               	    end
                               S3: begin
                                      output_bit = 1'b1;
                                      if (input_bit)
                                      		current_state <= S1;
                                      else
                                                current_state <= S2;
                               end
                        endcase                         
endmodule
