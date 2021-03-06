
module Control_Logic_Static(input logic clk, 
							input logic reset,
							input logic [19:0] bufferadd,
							input logic [7:0] keycode, //check this shit
							input logic press,
							input logic [9:0] frameX, // check the length
							input logic [9:0] frameY,
							input logic [9:0] DK_X,
							input logic [9:0] DK_Y,
							input logic [3:0] no,
							output logic [18:0] frame_num,
							output logic [3:0] DK_motion, // 0: Idle_R, 1: Idle_L, 2: Walk_R, 3: Walk_L, 4: Jump_R, 5: Jump_L, 6: Shock!
							output logic [18:0] BGadd,
							output logic [24:0] counter_out
							);


enum logic [7:0] { Idle_L1, Idle_L2, Idle_L3, Idle_L4, Idle_L5, Idle_L6, 
						 Idle_L7, Idle_L8, Idle_L9, Idle_L10, Idle_L11,
						 Idle_L12,Idle_L13, Idle_L14, Idle_L15, Idle_L16, Idle_L17, 
						 Idle_L18,Idle_L19, Idle_L20, Idle_L21, Idle_L22,
						 
						 Idle_R1, Idle_R2, Idle_R3, Idle_R4, Idle_R5, Idle_R6, 
						 Idle_R7, Idle_R8, Idle_R9, Idle_R10, Idle_R11, 
						 Idle_R12,Idle_R13, Idle_R14, Idle_R15, Idle_R16, Idle_R17, 
						 Idle_R18,Idle_R19, Idle_R20, Idle_R21, Idle_R22,
						 
						 Walk_L1, Walk_L2, Walk_L3, Walk_L4, Walk_L5, Walk_L6,
						 Walk_L7, Walk_L8, Walk_L9, Walk_L10, Walk_L11, 
						 Walk_L12, Walk_L13, Walk_L14, Walk_L15, Walk_L16, Walk_L17,
						 Walk_L18, Walk_L19, Walk_L20,
						 
						 Walk_R1, Walk_R2, Walk_R3, Walk_R4, Walk_R5, Walk_R6,
						 Walk_R7, Walk_R8, Walk_R9, Walk_R10, Walk_R11, 
						 Walk_R12, Walk_R13, Walk_R14, Walk_R15, Walk_R16, Walk_R17,
						 Walk_R18, Walk_R19, Walk_R20,
						 
						 Jump_L1, Jump_L2, Jump_L3, Jump_L4, Jump_L5, Jump_L6, 
						 Jump_L7, Jump_L8, Jump_L9, Jump_L10, Jump_L11,
						 Jump_L12, Jump_L13, Jump_L14, Jump_L15, Jump_L16, Jump_L17,
						 Jump_L18, Jump_L19, Jump_L20, Jump_L21,

						 Jump_R1, Jump_R2, Jump_R3, Jump_R4, Jump_R5, Jump_R6, 
						 Jump_R7, Jump_R8, Jump_R9, Jump_R10, Jump_R11,
						 Jump_R12, Jump_R13, Jump_R14, Jump_R15, Jump_R16, Jump_R17,
						 Jump_R18, Jump_R19, Jump_R20, Jump_R21,
						 
						 Shock1, Shock2, Shock3, Shock4, Shock5, Shock6, Shock7,
						 Shock8, Shock9, Shock10, Shock11, Shock12, Shock13,
						 Shock14, Shock15, Shock16, Shock17, Shock18, Shock19,
						 Shock20, Shock21, Shock22
						}
					state, next_state;
					
logic [24:0] counter, counter_in; //55

					
always_ff @ (posedge clk)
begin
	if(reset == 1'b1)  //active low
		begin
			state <= Idle_R1;
			counter <= 25'd0;

		end
	
	else
		begin
			if(counter_in == 25'd4500001)
				counter <= 25'd0;
			else
				counter <= counter_in;
			
				state <= next_state;
		end
end

always_comb 
begin
	next_state = state;
	counter_out = counter;
	case(state)
	//Idle Right Stages 1-12
		Idle_R1 :
		begin
				if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press && no == 4'd1) // Jump_R
					begin
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else if(counter == 25'd4500000)
					begin 
						next_state = Idle_R2;
					end
				else
					begin
						next_state = Idle_R1;
					end
			end	
			
		Idle_R2 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R3;
				end
			else
				begin
					next_state = Idle_R2;
				end
		end	
	
		
		
		Idle_R3 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R4;
				end
			else
				begin
					next_state = Idle_R3;
				end
		end	
	
		Idle_R4 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R5;
				end
			else
				begin
					next_state = Idle_R4;
				end
		end	
	
		Idle_R5 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R6;
				end
			else
				begin
					next_state = Idle_R5;	
				end
		end	
	
	
		Idle_R6 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R7;
				end
			else
				begin
					next_state = Idle_R6;
				end
		end	
	
		Idle_R7 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R8;
				end
			else
				begin
					next_state = Idle_R7;
				end
		end	
	
		Idle_R8 :	
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end	
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R9;
				end
			else
				begin
					next_state = Idle_R8;
				end
		end	
	
		Idle_R9 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R10;
				end
			else
				begin
					next_state = Idle_R9;
				end
		end	
	
		Idle_R10 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R11;
				end
			else
				begin
					next_state = Idle_R10;
				end
		end	
	
		Idle_R11 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R12;
				end
			else
				begin
					next_state = Idle_R11;
				end
		end	
		
		Idle_R12 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R13;
				end
			else
				begin
					next_state = Idle_R12;
				end
		end	
		
		Idle_R13 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R14;
				end
			else
				begin
					next_state = Idle_R13;
				end
		end	
		
		Idle_R14 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R15;
				end
			else
				begin
					next_state = Idle_R14;
				end
		end	
		
		Idle_R15 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R16;
				end
			else
				begin
					next_state = Idle_R15;
				end
		end	
		
		Idle_R16 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R17;
				end
			else
				begin
					next_state = Idle_R16;
				end
		end	
		
		Idle_R17 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R18;
				end
			else
				begin
					next_state = Idle_R17;
				end
		end	
		
		Idle_R18 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R19;
				end
			else
				begin
					next_state = Idle_R18;
				end
		end	
		
		Idle_R19 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R20;
				end
			else
				begin
					next_state = Idle_R19;
				end
		end	
		
		Idle_R20 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R21;
				end
			else
				begin
					next_state = Idle_R20;
				end
		end	
		
		Idle_R21 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					counter_in = 6'd0;
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R22;
				end
			else
				begin
					next_state = Idle_R21;
				end
		end	
		
		Idle_R22 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_R1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_R1;
				end
			else
				begin
					next_state = Idle_R22;
				end
		end	
		
		
		//Idle left stages 1-12
		Idle_L1 :
		begin
				if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press && no == 4'd1)
					begin
						next_state = Shock1;
					end
				else if(counter == 25'd4500000)
					begin
						 
						next_state = Idle_L2;
					end
				else
					begin
						next_state = Idle_L1;
					end
			end	
			
		Idle_L2 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L3;
				end
			else
				begin
					next_state = Idle_L2;
				end
		end	
	
		
		
		Idle_L3 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L4;
				end
			else
				begin
					next_state = Idle_L3;
				end
		end	
	
		Idle_L4 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L5;
				end
			else
				begin
					next_state = Idle_L4;
				end
		end	
	
		Idle_L5 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L6;
				end
			else
				begin
					next_state = Idle_L5;
				end
		end	
	
	
		Idle_L6 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L7;
				end
			else
				begin
					next_state = Idle_L6;
				end
		end	
	
		Idle_L7 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
				   next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L8;
				end
			else
				begin
					next_state = Idle_L7;
				end
		end	
	
		Idle_L8 :	
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L9;
				end
			else
				begin
					next_state = Idle_L8;
				end
		end	
	
		Idle_L9 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L10;
				end
			else
				begin
					next_state = Idle_L9;
				end
		end	
	
		Idle_L10 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L11;
				end
			else
				begin
					next_state = Idle_L10;
				end
		end	
	
		Idle_L11 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L12;
				end
			else
				begin
					next_state = Idle_L11;
				end
		end	
		
		Idle_L12 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L13;
				end
			else
				begin
					next_state = Idle_L12;
				end
		end	
		
		Idle_L13 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L14;
				end
			else
				begin
					next_state = Idle_L13;
				end
		end	
		
		Idle_L14 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L15;
				end
			else
				begin
					next_state = Idle_L14;
				end
		end	
		
		Idle_L15 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L16;
				end
			else
				begin
					next_state = Idle_L15;
				end
		end	
		
		Idle_L16 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L17;
				end
			else
				begin
					next_state = Idle_L16;
				end
		end	
		
		Idle_L17 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
				next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L18;
				end
			else
				begin
					next_state = Idle_L17;
				end
		end	
		
		Idle_L18 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L19;
				end
			else
				begin
					next_state = Idle_L18;
				end
		end	
		
		Idle_L19 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L20;
				end
			else
				begin
					next_state = Idle_L19;
				end
		end	
		
		Idle_L20 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L21;
				end
			else
				begin
					next_state = Idle_L20;
				end
		end	
		
		Idle_L21 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L22;
				end
			else
				begin
					next_state = Idle_L21;
				end
		end	
		
		Idle_L22 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
				begin
					 
					next_state = Walk_R1;
				end
			else if(keycode == 8'h6b && press) // walk_L 
				begin
					 
					next_state = Walk_L1;
				end
			else if(keycode == 8'h75 && press) // Jump_R
				begin
					 
					next_state = Jump_L1;
				end
			else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
			else if(counter == 25'd4500000)
				begin
					 
					next_state = Idle_L1;
				end
			else
				begin
					next_state = Idle_L22;
				end
		end	
		
		
		//walk right stages 1-20
		Walk_R1 :
		begin
				if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R2;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R2 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R3;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R2;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R3 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R4;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R3;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R4 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R5;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R4;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R5 :
		begin
		if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R6;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R5;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R6 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R7;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R6;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R7 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R8;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R7;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R8 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R9;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R8;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R9 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R10;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R9;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R10 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R11;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R10;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R11 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R12;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R11;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R12 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R13;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R12;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R13 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R14;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R13;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R14 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R15;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R14;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R15 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R16;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R15;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R16 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R17;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R16;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R17 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R18;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R17;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R18 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R19;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R18;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R19 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R20;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R19;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end
		end
		
		Walk_R20 :
		begin
			if(keycode == 8'h74 && press && counter == 25'd4500000 ) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h74 && press)
					begin
						next_state = Walk_R20;
					end
				else if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_R1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin
						 
						next_state = Idle_R1;
					end;
		end
		

		//walk left stages 1-20
		Walk_L1 :
		begin
				if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L2;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L1;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L2 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L3;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L2;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L3 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L4;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L3;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L4 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L5;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L4;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L5 :
		begin
				if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L6;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L5;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L6 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L7;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L6;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L7 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L8;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L7;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L8 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L9;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L8;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L9 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L10;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L9;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L10 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L11;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L10;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L11 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L12;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L11;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L12 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L13;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L12;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L13 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L14;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L13;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L14 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L15;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L14;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L15 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L16;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L15;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L16 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L17;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L16;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L17 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L18;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L17;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L18 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L19;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L18;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L19 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L20;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L19;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end
		
		Walk_L20 :
		begin
			if(keycode == 8'h74 && press) //walk_R  -- change the keycode
					begin
						 
						next_state = Walk_R1;
					end
				else if(keycode == 8'h6b && press && counter == 25'd4500000 ) // walk_L 
					begin
						 
						next_state = Walk_L1;
					end
				else if(keycode == 8'h6b && press)
					begin
						next_state = Walk_L20;
					end
				else if(keycode == 8'h75 && press) // Jump_R
					begin
						 
						next_state = Jump_L1;
					end
				else if(keycode == 8'h2b && press)
					begin
						next_state = Shock1;
					end
				else 
					begin	
						 
						next_state = Idle_L1;
					end
		end

		//jump right stages 1-21
		Jump_R1 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L1;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R2;
					end
			else 
				begin	
					next_state = Jump_R1;
				end
		end
		
		Jump_R2 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L2;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R3;
					end
				else 
					begin	
						next_state = Jump_R2;
					end
		end
		
		Jump_R3 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L2;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R4;
					end
				else 
					begin	
						next_state = Jump_R3;
					end
		end
		
		Jump_R4 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L4;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R5;
					end
				else 
					begin	
						next_state = Jump_R4;
					end
		end
		
		Jump_R5 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L5;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R6;
					end
				else 
					begin	
						next_state = Jump_R5;
					end
		end
		
		Jump_R6 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L6;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R7;
					end
				else 
					begin	
						next_state = Jump_R6;
					end
		end
		
		Jump_R7 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L7;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R8;
					end
				else 
					begin	
						next_state = Jump_R7;
					end
		end
		
		Jump_R8 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L8;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R9;
					end
				else 
					begin	
						next_state = Jump_R8;
					end
		end
		
		Jump_R9 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L9;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R10;
					end
				else 
					begin	
						next_state = Jump_R9;
					end
		end
		
		Jump_R10 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L10;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R11;
					end
				else 
					begin	
						next_state = Jump_R10;
					end
		end
		
		Jump_R11 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L11;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R12;
					end
				else 
					begin	
						next_state = Jump_R11;
					end
		end
		
		Jump_R12 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L12;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R13;
					end
				else 
					begin	
						next_state = Jump_R12;
					end
		end
		
		Jump_R13 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L13;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R14;
					end
				else 
					begin	
						next_state = Jump_R13;
					end
		end
		
		Jump_R14 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L14;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R15;
					end
				else 
					begin	
						next_state = Jump_R14;
					end
		end
		
		Jump_R15 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L15;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R16;
					end
				else 
					begin	
						next_state = Jump_R15;
					end
		end
		
		Jump_R16 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L16;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R17;
					end
				else 
					begin	
						next_state = Jump_R16;
					end
		end
		
		Jump_R17 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L17;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R18;
					end
				else 
					begin	
						next_state = Jump_R17;
					end
		end
		
		Jump_R18 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L18;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R19;
					end
				else 
					begin	
						next_state = Jump_R18;
					end
		end
		
		Jump_R19 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L19;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R20;
					end
				else 
					begin	
						next_state = Jump_R19;
					end
		end
		
		Jump_R20 :
		begin
			if(keycode == 8'h6b && press) // walk_L 
					begin
						 
						next_state = Jump_L20;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_R21;
					end
				else 
					begin	
						next_state = Jump_R20;
					end
		end
		
		Jump_R21 :
		begin
			if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Idle_R1;
					end
			else 
					begin	
						next_state = Jump_R21;
					end
		end

		//jump left stages 1-12

		Jump_L1 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R1;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L2;
					end
				else 
					begin	
						next_state = Jump_L1;
					end
		end
		
		Jump_L2 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R2;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L3;
					end
				else 
					begin	
						next_state = Jump_L2;
					end
		end
		
		Jump_L3 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R3;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L4;
					end
				else 
					begin	
						next_state = Jump_L3;
					end
		end
		
		Jump_L4 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R4;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L5;
					end
				else 
					begin	
						next_state = Jump_L4;
					end
		end
		
		Jump_L5 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R5;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L6;
					end
				else 
					begin	
						next_state = Jump_L5;
					end
		end
		
		Jump_L6 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R6;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L7;
					end
				else 
					begin	
						next_state = Jump_L6;
					end
		end
		
		Jump_L7 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R7;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L8;
					end
				else 
					begin	
						next_state = Jump_L7;
					end
		end
		
		Jump_L8 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R8;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L9;
					end
				else 
					begin	
						next_state = Jump_L8;
					end
		end
		
		Jump_L9 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R9;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L10;
					end
				else 
					begin	
						next_state = Jump_L9;
					end
		end
		
		Jump_L10 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R10;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L11;
					end
				else 
					begin	
						next_state = Jump_L10;
					end
		end
		
		Jump_L11 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R11;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L12;
					end
				else 
					begin	
						next_state = Jump_L11;
					end
		end
		
		Jump_L12 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R12;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L13;
					end
				else 
					begin	
						next_state = Jump_L12;
					end
		end
		
		Jump_L13 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R13;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L14;
					end
				else 
					begin	
						next_state = Jump_L13;
					end
		end
		
		Jump_L14 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R14;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L15;
					end
				else 
					begin	
						next_state = Jump_L14;
					end
		end
		
		Jump_L15 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R15;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L16;
					end
				else 
					begin	
						next_state = Jump_L15;
					end
		end
		
		Jump_L16 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R16;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L17;
					end
				else 
					begin	
						next_state = Jump_L16;
					end
		end
		
		Jump_L17 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R17;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L18;
					end
				else 
					begin	
						next_state = Jump_L17;
					end
		end
		
		Jump_L18 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R18;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L19;
					end
				else 
					begin	
						next_state = Jump_L18;
					end
		end
		
		Jump_L19 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R19;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L20;
					end
				else 
					begin	
						next_state = Jump_L19;
					end
		end
		
		Jump_L20 :
		begin
			if(keycode == 8'h74 && press) // walk_L 
					begin
						 
						next_state = Jump_R20;
					end
			else if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Jump_L21;
					end
				else 
					begin	
						next_state = Jump_L20;
					end
		end
		
		Jump_L21 :
		begin
			if(counter == 25'd4500000) // Jump_R
					begin
						 
						next_state = Idle_L1;
					end
				else 
					begin	
						next_state = Jump_L21;
					end
		end
		
		//shock states 1-22
		Shock1 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock2;
				end
			else 
				begin	
					next_state = Shock1;
				end
		end
		
		Shock2 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock3;
				end
			else 
				begin	
					next_state = Shock2;
				end
		end
		
		Shock3 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock4;
				end
			else 
				begin	
					next_state = Shock3;
				end
		end
		
		Shock4 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock5;
				end
			else 
				begin	
					next_state = Shock4;
				end
		end
		
		Shock5 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock6;
				end
			else 
				begin	
					next_state = Shock5;
				end
		end
		
		Shock6 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock7;
				end
			else 
				begin	
					next_state = Shock6;
				end
		end
		
		Shock7 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock8;
				end
			else 
				begin	
					next_state = Shock7;
				end
		end
		
		Shock8 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock9;
				end
			else 
				begin	
					next_state = Shock8;
				end
		end
		
		Shock9 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock10;
				end
			else 
				begin	
					next_state = Shock9;
				end
		end
		
		Shock10 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock11;
				end
			else 
				begin	
					next_state = Shock10;
				end
		end
		
		Shock11 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock12;
				end
			else 
				begin	
					next_state = Shock11;
				end
		end
		
		Shock12 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock13;
				end
			else 
				begin	
					next_state = Shock12;
				end
		end
		
		Shock13 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock14;
				end
			else 
				begin	
					next_state = Shock13;
				end
		end
		
		Shock14 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock15;
				end
			else 
				begin	
					next_state = Shock14;
				end
		end
		
		Shock15 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock16;
				end
			else 
				begin	
					next_state = Shock15;
				end
		end
		
		Shock16 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock17;
				end
			else 
				begin	
					next_state = Shock16;
				end
		end
		
		Shock17 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock18;
				end
			else 
				begin	
					next_state = Shock17;
				end
		end
		
		Shock18 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock19;
				end
			else 
				begin	
					next_state = Shock18;
				end
		end
		
		Shock19 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock20;
				end
			else 
				begin	
					next_state = Shock19;
				end
		end
		
		Shock20 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock21;
				end
			else 
				begin	
					next_state = Shock20;
				end
		end
		
		Shock21 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Shock22;
				end
			else 
				begin	
					next_state = Shock21;
				end
		end
		
		Shock22 :
		begin
			if(counter == 25'd4500000) // Jump_R
				begin
					next_state = Idle_R1;
				end
			else 
				begin	
					next_state = Shock22;
				end
		end

	endcase
	
	// 
	
	case(state)
		Idle_R1 :
			begin
				BGadd= (19'd61 * 19'd240); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd0;
				counter_in = counter + 25'd1;
			end
			
		Idle_R2 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;
	
			end
			
		Idle_R3 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;
			
			end
			
		Idle_R4 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;		
			end
			
		Idle_R5 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;	
			end
			
		Idle_R6 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;		
			end
			
		Idle_R7 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;		
			end
	
		Idle_R8 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;	
			end
			
		Idle_R9 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;		
			end
			
		Idle_R10 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd0;			
				counter_in = counter + 25'd1;
			end
			
		Idle_R11 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd0;			
				counter_in = counter + 25'd1;		
			end
			
		Idle_R12 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd0;			
				counter_in = counter + 25'd1;		
			end
			
		Idle_R13 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd0;			
				counter_in = counter + 25'd1;		
			end
	
		Idle_R14 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;			
			end
		
		Idle_R15 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;			
			end
		
		Idle_R16 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;			
			end
			
		Idle_R17 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;			
			end
			
		Idle_R18 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;			
			end
		
		Idle_R19 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;			
			end
		
		Idle_R20 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;			
			end
		
		Idle_R21 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd0;		
				counter_in = counter + 25'd1;		
			end
		
		Idle_R22 :
			begin
				BGadd= (19'd61 * 19'd240); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd0;
				counter_in = counter + 25'd1;
			end
			
		
		//Idle left stages 1-22
		
		Idle_L1 :
			begin
				BGadd= (19'd61 * 19'd240); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;
			end
			
		Idle_L2 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;		
			end
			
		Idle_L3 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
			
		Idle_L4 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
			
		Idle_L5 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
			
		Idle_L6 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
			
		Idle_L7 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
	
		Idle_L8 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
			
		Idle_L9 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
			
		Idle_L10 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;		
			end
			
		Idle_L11 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;		
			end
			
		Idle_L12 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;		
			end
			
		Idle_L13 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;		
			end
	
		Idle_L14 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
		
		Idle_L15 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
		
		Idle_L16 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
			
		Idle_L17 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
			
		Idle_L18 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
		
		Idle_L19 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
		
		Idle_L20 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;			
			end
		
		Idle_L21 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;		
			end
		
		Idle_L22 :
			begin
				BGadd= (19'd61 * 19'd240); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd1;
				counter_in = counter + 25'd1;
			end
		
		//walk right stages 1-20
		Walk_R1 :
			begin
				BGadd= (19'd61 * 19'd240); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;
			end
			
		Walk_R2 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;		
			end
			
		Walk_R3 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_R4 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_R5 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_R6 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_R7 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
	
		Walk_R8 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_R9 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_R10 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;		
			end
			
		Walk_R11 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;		
			end
			
		Walk_R12 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd11; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;		
			end
			
		Walk_R13 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd12; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;		
			end
	
		Walk_R14 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd13; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
		
		Walk_R15 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd14; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
		
		Walk_R16 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd15; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_R17 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd16; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_R18 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd17; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
		
		Walk_R19 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd18; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
		
		Walk_R20 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd19; 
				DK_motion = 4'd2;		
				counter_in = counter + 25'd1;			
			end
	

		//walk left stages 1-20
		Walk_L1 :
			begin
				BGadd= (19'd61 * 19'd240); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;
			end
			
		Walk_L2 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;		
			end
			
		Walk_L3 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_L4 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_L5 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_L6 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_L7 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
	
		Walk_L8 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_L9 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_L10 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;		
			end
			
		Walk_L11 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;		
			end
			
		Walk_L12 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd11; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;		
			end
			
		Walk_L13 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd12; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;		
			end
	
		Walk_L14 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd13; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
		
		Walk_L15 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd14; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
		
		Walk_L16 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd15; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_L17 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd16; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
			
		Walk_L18 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd17; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
		
		Walk_L19 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd18; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end
		
		Walk_L20 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd19; 
				DK_motion = 4'd3;		
				counter_in = counter + 25'd1;			
			end

		//jump right stages 1-21
		Jump_R1 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R2 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
			
			
		Jump_R3 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
			
		Jump_R4 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R5 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
			
		Jump_R6 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
			
		Jump_R7 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R8 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R9 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R10 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R11 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R12 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd11; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R13 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd12; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R14 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd13; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
			
		Jump_R15 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd14; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R16 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd15; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R17 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd16; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R18 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd17; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R19 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd18; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R20 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd19; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
		
		Jump_R21 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd20; 
				DK_motion = 4'd4;		
				counter_in = counter + 25'd1;
			end
			
			

		//jump left stages 1-21

			Jump_L1 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
		
			Jump_L2 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			
			Jump_L3 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			
			Jump_L4 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			
			Jump_L5 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L6 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L7 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L8 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L9 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L10 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L11 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L12 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd11; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			
			Jump_L13 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd12; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L14 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd13; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L15 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd14; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L16 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd15; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L17 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd16; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L18 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd17; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L19 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd18; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L20 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd19; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			Jump_L21 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd20; 
				DK_motion = 4'd5;		
				counter_in = counter + 25'd1;
			end
			
			//shock states 1-22
			Shock1 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd0; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock2 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd1; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock3 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd2; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock4 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd3; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock5 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd4; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock6 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd5; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock7 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd6; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock8 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd7; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock9 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd8; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock10 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd9; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock11 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd10; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock12 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd11; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			
			Shock13 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd12; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			
			Shock14 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd13; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock15 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd14; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock16 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd15; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock17 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd16; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock18 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd17; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock19 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd18; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock20 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd19; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock21 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd20; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
			Shock22 :
			begin
				BGadd= (19'd61 * 19'd480 + bufferadd); // (DK_X * 19'd240) 
				frame_num = 18'd21; 
				DK_motion = 4'd6;		
				counter_in = counter + 25'd1;
			end
			
		endcase
		
end



					
							
endmodule

							