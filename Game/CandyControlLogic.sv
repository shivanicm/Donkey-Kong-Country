module Candy_Control_Logic(input logic clk, 
							input logic reset,
							input logic [7:0] keycode,
							input logic press,
							output logic [18:0] frame_num
							);

enum logic [5:0] { Wow1, Wow2, Wow3, Wow4, Wow5, Wow6, Wow7, Wow8, Wow9, Wow10, Wow11,
						 Wow12, Wow13, Wow14, Wow15, Wow16, Wow17, Wow18, Wow19, Wow20, Wow21, 
						 Wow22} state, next_state;

logic [24:0] counter, counter_in; //55

always_ff @ (posedge clk)
begin
	if(reset == 1'b1)  //active low
		begin
			state <= Wow1;
			counter <= 25'd0;
		end
	else if(keycode == 8'h2b && press)
		begin
			state <= Wow1;
			counter <=25'd0;
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
		
		Wow1:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow2;
				end
			else 
				begin	
					next_state = Wow1;
				end
		end
		
		Wow2:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow3;
				end
			else 
				begin	
					next_state = Wow2;
				end
		end
		
		Wow3:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow4;
				end
			else 
				begin	
					next_state = Wow3;
				end
		end
		
		Wow4:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow5;
				end
			else 
				begin	
					next_state = Wow4;
				end
		end
		
		Wow5:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow6;
				end
			else 
				begin	
					next_state = Wow5;
				end
		end
		
		Wow6:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow7;
				end
			else 
				begin	
					next_state = Wow6;
				end
		end
		
		Wow7:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow8;
				end
			else 
				begin	
					next_state = Wow7;
				end
		end
		
		Wow8:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow9;
				end
			else 
				begin	
					next_state = Wow8;
				end
		end
		
		Wow9:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow10;
				end
			else 
				begin	
					next_state = Wow9;
				end
		end
		
		Wow11:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow12;
				end
			else 
				begin	
					next_state = Wow11;
				end
		end
		
		Wow12:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow13;
				end
			else 
				begin	
					next_state = Wow12;
				end
		end
		
		Wow13:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow14;
				end
			else 
				begin	
					next_state = Wow13;
				end
		end
		
		Wow14:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow15;
				end
			else 
				begin	
					next_state = Wow14;
				end
		end
		
		Wow15:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow16;
				end
			else 
				begin	
					next_state = Wow15;
				end
		end
		
		
		Wow16:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow17;
				end
			else 
				begin	
					next_state = Wow16;
				end
		end
		
		Wow17:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow18;
				end
			else 
				begin	
					next_state = Wow17;
				end
		end
		
		Wow18:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow19;
				end
			else 
				begin	
					next_state = Wow18;
				end
		end
		
		Wow19:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow20;
				end
			else 
				begin	
					next_state = Wow19;
				end
		end
		
		Wow20:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow21;
				end
			else 
				begin	
					next_state = Wow20;
				end
		end
		
		Wow22:
		begin
			if(counter == 25'd6240000) // Jump_R
				begin
					next_state = Wow1;
				end
			else 
				begin	
					next_state = Wow22;
				end
		end
		
	endcase
	
	case(state)
	
		Wow1:
		begin
			frame_num = 18'd0; 
			counter_in = counter + 25'd1;
		end
		
		Wow2:
		begin
			frame_num = 18'd1; 
			counter_in = counter + 25'd1;
		end
		
		Wow3:
		begin
			frame_num = 18'd2; 
			counter_in = counter + 25'd1;
		end
		
		Wow4:
		begin
			frame_num = 18'd3; 
			counter_in = counter + 25'd1;
		end
		
		Wow5:
		begin
			frame_num = 18'd4; 
			counter_in = counter + 25'd1;
		end
		
		Wow6:
		begin
			frame_num = 18'd5; 
			counter_in = counter + 25'd1;
		end
		
		Wow7:
		begin
			frame_num = 18'd6; 
			counter_in = counter + 25'd1;
		end
		
		Wow8:
		begin
			frame_num = 18'd7; 
			counter_in = counter + 25'd1;
		end
		
		Wow9:
		begin
			frame_num = 18'd8; 
			counter_in = counter + 25'd1;
		end
		
		Wow10:
		begin
			frame_num = 18'd9; 
			counter_in = counter + 25'd1;
		end
		
		Wow11:
		begin
			frame_num = 18'd10; 
			counter_in = counter + 25'd1;
		end
		
		Wow12:
		begin
			frame_num = 18'd0; 
			counter_in = counter + 25'd1;
		end
		
		Wow13:
		begin
			frame_num = 18'd1; 
			counter_in = counter + 25'd1;
		end
		
		Wow14:
		begin
			frame_num = 18'd2; 
			counter_in = counter + 25'd1;
		end
		
		Wow15:
		begin
			frame_num = 18'd3; 
			counter_in = counter + 25'd1;
		end
		
		Wow16:
		begin
			frame_num = 18'd4; 
			counter_in = counter + 25'd1;
		end
		
		Wow17:
		begin
			frame_num = 18'd5; 
			counter_in = counter + 25'd1;
		end
		
		Wow18:
		begin
			frame_num = 18'd6; 
			counter_in = counter + 25'd1;
		end
		
		Wow19:
		begin
			frame_num = 18'd7; 
			counter_in = counter + 25'd1;
		end
		
		Wow20:
		begin
			frame_num = 18'd8; 
			counter_in = counter + 25'd1;
		end
		
		Wow21:
		begin
			frame_num = 18'd9; 
			counter_in = counter + 25'd1;
		end
		
		Wow22:
		begin
			frame_num = 18'd10; 
			counter_in = counter + 25'd1;
		end
		
	endcase
end
	
endmodule
