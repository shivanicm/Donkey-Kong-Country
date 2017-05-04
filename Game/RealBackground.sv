module RealBackground(
				input Clk,
				input reset,
				input [22:0] read_address,
				inout wire [7:0] data_out,
				
				output logic [22:0] out_add,
				output logic [3:0] out1,
				output logic [3:0] out2,
				output logic sel
				
);

	enum logic  {R1, R2} state, next_state;
	logic [3:0] reg1, reg1_in;
	logic [22:0] add, add_in;


always_ff @ (posedge Clk)
	begin
	
		if(reset == 1'b1)  //active low
		begin
			state <= R1;
		end
	
	else
		begin
			state <= next_state;
			reg1 <= reg1_in;
			add <= add_in;
		end

	end
	
always_comb
	begin
		next_state = state;
		
		case(state) 

			R1:
			begin
				next_state = R2;
			end
			
			R2:
			begin
				next_state = R1;
			end
		endcase

		
		
		case(state)
			R1 :
			begin
				reg1_in = reg1;
				add_in = read_address;
				out1 = reg1;
				out2 = 4'b0;
				out_add = read_address;
				sel = 1'b0;
				
			end
			
			R2 :
			begin
				reg1_in = data_out[7:4];
				add_in = add;
				out1 = 4'b0;
				out2 = data_out[3:0];
				out_add = add;
				sel = 1'b1;
			end
			
			
			
		endcase
	end



endmodule

