module simplelogic (input  logic Clk,
							output logic [19:0]  counter);


enum logic [1:0] {WAIT, COMPUTE} state, next_state;

logic [15:0] counter_in;

  
always_ff @ (posedge Clk) begin

        state <= next_state;
        counter <= counter_in;

end

always_comb begin
    // Next state logic
    next_state = state;
    case (state)
        // Wait until IO is ready.
        WAIT: begin
                next_state = COMPUTE;
        end
       COMPUTE: begin
            if (counter == 16'd1500)
                next_state = WAIT;
				else	
					next_state = COMPUTE;
        end
  
    endcase

    case (state)
        WAIT: begin
				counter_in = 20'd0;
        end
            
        COMPUTE: begin
            counter_in = counter + 20'd1;
        end
    endcase

	 end
endmodule
