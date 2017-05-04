module spriteMUX(input logic [3:0] in0,
					  input logic [3:0] in1,
					  input logic [3:0] in2,
					  input logic [3:0] in3,
					  input logic [3:0] sel,
					  output logic [3:0] out);
			

			always_comb
			begin
				case(sel)
					4'd0: out = in0; //IdleR
					4'd1: out = in0; //IdleL
					
					4'd2: out = in1;
					4'd3: out = in1;
					
					4'd4: out = in2;
					4'd5: out = in2;
					
					4'd6: out = in3;
			
					default : out = in0;
				endcase
			end
endmodule
