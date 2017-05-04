module PrintImg( input logic[15:0] bg, 
					  input logic[15:0] img,
					  input logic[15:0] candy,
					  input logic[15:0] text,
					  input logic[15:0] banana1,
					  input logic[15:0] banana2,
					  input logic[15:0] banana3,
					  input logic[15:0] banana4,
					  input logic[15:0] banana5,
					  input logic[4:0] bananas,
					  input logic [9:0] DrawX,
					  input logic [9:0] DrawY,
					  input logic [9:0] DK_X,
					  input logic [9:0] DK_Y,
					  input logic [15:0] outX,
					  input logic [7:0] H,
					  input logic [7:0] W,
					  input logic [3:0] sel,
					  inout logic[15:0] out);
					  
	//out1 = (((X + DrawX - 19'd946) * 19'd1 + (DrawY - 19'd255) * 19'd62) + (19'd1024 * framenum)); //(943,255) - bottom left 
	//out2 = (((X + DrawX - 19'd1335) * 19'd1 + (DrawY - 19'd270) * 19'd62) + (19'd1024 * framenum)); //(1335,270)
	//out3 = (((X + DrawX - 19'd1500) * 19'd1 + (DrawY - 19'd270) * 19'd62) + (19'd1024 * framenum)); //(1500,270)
	//out4 = (((X + DrawX - 19'd2099) * 19'd1 + (DrawY - 19'd286) * 19'd62) + (19'd1024 * framenum)); //(2099,286)
	//out5 = (((X + DrawX - 19'd2562) * 19'd1 + (DrawY - 19'd336) * 19'd62) + (19'd1024 * framenum)); //(2562,336)
	  
	logic [15:0] X, Y;
	assign X[9:0] = DrawX;
	
	
	always_comb
	begin
		//out = bg;
		
		if(DrawX > 10'd580 && DrawX < (10'd630) && DrawY > 10'd0 && DrawY < (10'd50) && text[15:11]!=5'd1 && text[10:5]!=6'd49 && text[4:0]!=5'd27 )
		begin
			out = text;
		end
		
		else if(sel == 4'd6)
		begin
		
			if(DrawX > DK_X && DrawX < (DK_X + 10'd80) && DrawY > DK_Y && DrawY < (DK_Y + 10'd100) && img[15:11]!=5'd1 && img[10:5]!=6'd49 && img[4:0]!=5'd27 )
			begin
				out = img; //added background removal condition
			end
		
			else if(DrawX > (DK_X + 10'd120) && DrawX < ((DK_X + 10'd120)+ 10'd42) && DrawY > DK_Y && DrawY < (DK_Y + 10'd90) && candy[15:11]!=5'd1 && candy[10:5]!=6'd49 && candy[4:0]!=5'd27) //change to pink
			begin
				out = candy; //added background removal condition
			end
		
			else
				out = bg;
			
		end
		
			
		
	
		else if(bananas[0] == 1 && outX > (16'd943 - 16'd640) && outX <(16'd943 + 16'd10) && X > (16'd943 - outX) && X < (16'd943 - outX + 10'd32) && DrawY > (16'd255 - 16'd32) && DrawY < (16'd255) && banana1[15:11]!=5'd1 && banana1[10:5]!=6'd49 && banana1[4:0]!=5'd27) 
		begin
			out = banana1;
		end
		
		else if(bananas[1] == 1 && outX > (16'd1335 - 16'd640) && outX <(16'd1335 + 16'd10) && X > (16'd1335 - outX) && X < (16'd1335 - outX + 10'd32) && DrawY > (16'd270 - 16'd32) && DrawY < (16'd270) && banana2[15:11]!=5'd1 && banana2[10:5]!=6'd49 && banana2[4:0]!=5'd27) 
		begin
			out = banana2;
		end
		
		else if(bananas[2] == 1 && outX > (16'd1500 - 16'd640) && outX <(16'd1500 + 16'd10) && X > (16'd1500 - outX) && X < (16'd1500 - outX + 10'd32) && DrawY > (16'd270 - 16'd32) && DrawY < (16'd270) && banana3[15:11]!=5'd1 && banana3[10:5]!=6'd49 && banana3[4:0]!=5'd27) 
		begin
			out = banana3;
		end
		
		else if(bananas[3] == 1 && outX > (16'd2099 - 16'd640) && outX <(16'd2099 + 16'd10) && X > (16'd2099 - outX) && X < (16'd2099 - outX + 10'd32) && DrawY > (16'd286 - 16'd32) && DrawY < (16'd286) && banana4[15:11]!=5'd1 && banana4[10:5]!=6'd49 && banana4[4:0]!=5'd27) 
		begin
			out = banana4;
		end
		
		else if(bananas[4] == 1 && outX > (16'd2562 - 16'd640) && outX <(16'd2562 + 16'd10) && X > (16'd2562 - outX) && X < (16'd2562 - outX + 10'd32) && DrawY > (16'd336 - 16'd32) && DrawY < (16'd336) && banana5[15:11]!=5'd1 && banana5[10:5]!=6'd49 && banana5[4:0]!=5'd27) 
		begin
			out = banana5;
		end
		
		else if(outX >=16'd2542)
		begin
			if(DrawX > (outX - 16'd2542 + 16'd70) && DrawX <= ((outX - 16'd2542 + 16'd70) + W) && DrawY > DK_Y && DrawY <= (DK_Y + H) && img[15:11]!=5'd1 && img[10:5]!=6'd49 && img[4:0]!=5'd27)
			begin
				out = img; //added background removal condition
			end
		
			else
				out = bg;
		end
		else
		begin
			if(DrawX > DK_X && DrawX <= (DK_X + W) && DrawY > DK_Y && DrawY <= (DK_Y + H) && img[15:11]!=5'd1 && img[10:5]!=6'd49 && img[4:0]!=5'd27)
			begin
				out = img; //added background removal condition
			end
		
			else
				out = bg;
		end
		
		
end		
endmodule

					  
	