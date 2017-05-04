module BananaCount(input clk,
						 input reset,
						 input [15:0] X,
						 input [15:0] Y,
						 output [4:0] out
						);
  //x90 , w20
	//out1 = (((X + DrawX - 19'd946) * 19'd1 + (DrawY - 19'd255) * 19'd62) + (19'd1024 * framenum)); //(943,255) - bottom left 
	//out2 = (((X + DrawX - 19'd1335) * 19'd1 + (DrawY - 19'd270) * 19'd62) + (19'd1024 * framenum)); //(1335,270)
	//out3 = (((X + DrawX - 19'd1500) * 19'd1 + (DrawY - 19'd270) * 19'd62) + (19'd1024 * framenum)); //(1500,270)
	//out4 = (((X + DrawX - 19'd2099) * 19'd1 + (DrawY - 19'd286) * 19'd62) + (19'd1024 * framenum)); //(2099,286)
	//out5 = (((X + DrawX - 19'd2562) * 19'd1 + (DrawY - 19'd336) * 19'd62) + (19'd1024 * framenum)); //(2562,336)						
						
logic [4:0] bananas, bananas_in;

always_ff @ (posedge clk or posedge reset)
begin
	if(reset)
	begin
		out <= 5'b11111;
		bananas <= 5'b11111;
		//bananas_in <= 5'b11111;
	end
	
	else 
	begin
		
		bananas <= bananas_in;
		out <= bananas;
	end

end

always_comb
begin
	if((X + 16'd90) <= (16'd946 + 16'd16) && (X + 16'd110 >= (16'd946 + 16'd16)) && (Y + 16'd80) >= (16'd255 - 16'd16) && (Y + 16'd20) <= (16'd255 - 16'd16))
	begin
		bananas_in[0] = 1'b0;
	end
	else	
		bananas_in[0] = bananas[0];
	
	
	if((X + 16'd90) <= (16'd1335 + 16'd16) && (X + 16'd110 >= (16'd1335 + 16'd16)) && (Y + 16'd80) >= (16'd270 - 16'd16) && (Y + 16'd20) <= (16'd270 - 16'd16))
	begin
		bananas_in[1] = 1'b0;
	end
	
		else	
		bananas_in[1] = bananas[1];
	
	if((X + 16'd90) <= (16'd1500 + 16'd16) && (X + 16'd110 >= (16'd1500 + 16'd16)) && (Y + 16'd80) >= (16'd270 - 16'd16) && (Y + 16'd20) <= (16'd270 - 16'd16))
	begin
		bananas_in[2] = 1'b0;
	end
	
		else	
		bananas_in[2] = bananas[2];
	
	if((X + 16'd90) <= (16'd2099 + 16'd16) && (X + 16'd110 >= (16'd2099 + 16'd16)) && (Y + 16'd80) >= (16'd286 - 16'd16) && (Y + 16'd20) <= (16'd286 - 16'd16))
	begin
		bananas_in[3] = 1'b0;
	end
	
		else	
		bananas_in[3] = bananas[3];
	
	if((X + 16'd90) <= (16'd2562 + 16'd16) && (X + 16'd110 >= (16'd2562 + 16'd16)) && (Y + 16'd80) >= (16'd336 - 16'd16) && (Y + 16'd20) <= (16'd336 - 16'd16))
	begin
		bananas_in[4] = 1'b0;
	end
	
		else	
		bananas_in[4] = bananas[4];
	
end


endmodule		


