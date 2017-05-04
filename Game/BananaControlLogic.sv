module Banana_Control_Logic(input logic clk, 
							input logic reset,
							output logic [18:0] frame_num
							);

enum logic [2:0] { Fruit1, Fruit2, Fruit3, Fruit4, Fruit5, Fruit6, Fruit7, Fruit8} state, next_state;

logic [24:0] counter, counter_in; //55

always_ff @ (posedge clk)
begin
	if(reset == 1'b1)  //active low
		begin
			state <= Fruit1;
			counter <= 25'd0;
		end
	
	else
		begin
			if(counter_in == 25'd6240001)
				counter <= 25'd0;
			else
				counter <= counter_in;
				state <= next_state;
		end
end

always_comb 
begin
	next_state = state;
	
	case(state)
		
		Fruit1:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Fruit2;
				end
			else 
				begin	
					next_state = Fruit1;
				end
		end
		
		Fruit2:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Fruit3;
				end
			else 
				begin	
					next_state = Fruit2;
				end
		end
		
		Fruit3:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Fruit4;
				end
			else 
				begin	
					next_state = Fruit3;
				end
		end
		
		Fruit4:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Fruit5;
				end
			else 
				begin	
					next_state = Fruit4;
				end
		end
		
		Fruit5:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Fruit6;
				end
			else 
				begin	
					next_state = Fruit5;
				end
		end
		
		Fruit6:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Fruit7;
				end
			else 
				begin	
					next_state = Fruit6;
				end
		end
		
		Fruit7:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Fruit1;
				end
			else 
				begin	
					next_state = Fruit7;
				end
		end
		/*
		Fruit8:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Fruit1;
				end
			else 
				begin	
					next_state = Fruit8;
				end
		end
		*/
	endcase
	
	case(state)
	
		Fruit1:
		begin
			frame_num = 18'd0; 
			counter_in = counter + 25'd1;
		end
		
		Fruit2:
		begin
			frame_num = 18'd1; 
			counter_in = counter + 25'd1;
		end
		
		Fruit3:
		begin
			frame_num = 18'd2; 
			counter_in = counter + 25'd1;
		end
		
		Fruit4:
		begin
			frame_num = 18'd3; 
			counter_in = counter + 25'd1;
		end
		
		Fruit5:
		begin
			frame_num = 18'd4; 
			counter_in = counter + 25'd1;
		end
		
		Fruit6:
		begin
			frame_num = 18'd5; 
			counter_in = counter + 25'd1;
		end
		
		Fruit7:
		begin
			frame_num = 18'd6; 
			counter_in = counter + 25'd1;
		end
		
	//	Fruit8:
//		begin
	//		frame_num = 18'd7; 
	//		counter_in = counter + 25'd1;
	//	end
		
	endcase
end









			
endmodule
