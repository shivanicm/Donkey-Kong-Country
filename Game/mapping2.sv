module mapping2(input logic reset,
					input logic state,
					input logic [15:0] prevX,
					input logic [15:0] prevY,
					input logic [24:0] counter,
					input logic [3:0] DKmotion,
					input logic [7:0] keycode,
					input logic press,
					input logic [18:0] num,
					output logic [15:0] X,
					output logic [15:0] Y,
					output logic [3:0] no); // 0: no, 1: IdleR1, 2: IdleL1
													// 5: JumpR21, 6: JumpL21

logic [15:0] ground, ground2;

always_comb 
begin
	no = 4'd0;
	ground = 16'd700;
	ground2 = 16'd700;
	
	if(reset == 1'd1) 
	begin
		X = 16'd0;
		Y = 16'd0;
	end
	
	else
	begin
		if(counter == 25'd4500000)
		begin
			//X coordination
			
			if(keycode == 8'h74 && press)
				begin
					if(prevX + 16'd5 > 16'd3100)
					X = prevX;
					else
					X = prevX + 16'd5;
				end
				
			else if(keycode == 8'h6b && press)
				begin
					if(prevX < 16'd1)
					begin
						X = prevX;
					end
					
					else if(prevX > 16'd1999 && (prevX - 16'd5) < 16'd1999)
					begin
						if(prevY < 16'd312 - 16'd70)
							X = prevX - 16'd5;
						else
							X = prevX; 
					
					end
				
					else if(prevX > 16'd2846 && (prevX - 16'd5) < 16'd2846)
					begin
						if(prevY < 16'd401 - 16'd70)
							X = prevX - 16'd5;
						else
							X = prevX; 
					
					end
				
					else
						X = prevX - 16'd5;
				end
			else
				begin
					X = prevX;
				end
				
		
		
			//ground setting
			if(prevX < 16'd434)
			begin
				ground = 16'd336  - 16'd70;
			end
			
			else if(prevX <16'd514)
			begin
				ground = 16'd340 + (((prevX - 16'd434) * 16'd15) / 16'd80)  - 16'd70;
			end
			
			else if(prevX < 16'd639)
			begin
				ground = 16'd355 - (((prevX - 16'd514) * 16'd18) / 16'd125)  - 16'd70;
			end
			
			else if(prevX < 16'd706)
			begin
				ground = 16'd337 + (((prevX - 16'd639) * 16'd9) / 16'd67)  - 16'd70;
			end
			
			else if(prevX < 16'd753)
			begin
				ground = 16'd346 + (((prevX - 16'd706) * 16'd9) / 16'd47)  - 16'd70;
				ground2 = 16'd279 - (((prevX - 16'd706) * 16'd8) / 16'd43)  - 16'd70;
			end
			
			else if(prevX < 16'd862)
			begin
				ground = 16'd355 - (((prevX - 16'd753) * 16'd18) / 16'd109)  - 16'd70;
				ground2 = 16'd271 - (((prevX - 16'd753) * 16'd15) / 16'd109)  - 16'd70;
			end
			
			else if(prevX < 16'd1009)
			begin
				//ground = 16'd355 - (((prevX - 16'd434) * 16'd18) / 16'd109)  - 16'd70;
				ground2 = 16'd256 + (((prevX - 16'd862) * 16'd23) / 16'd147)  - 16'd70;
				if(prevX < 16'd976)
					ground = 16'd337 + (((prevX - 16'd862) * 16'd18) / 16'd114)  - 16'd70;
				else	
					ground = 16'd355 - (((prevX - 16'd976) * 16'd7) / 16'd33)  - 16'd70;
			end
			
			else if(prevX < 16'd1090)
			begin
				ground = 16'd348 - (((prevX  - 16'd1009) * 16'd13) / 16'd81)  - 16'd70;
			end
			
			else if(prevX < 16'd1190)
			begin
				ground = 16'd336 + (((prevX - 16'd1090) * 16'd13) / 16'd99)  - 16'd70;
			end
			
			else if(prevX < 16'd1294)
			begin
				ground  = 16'd349  - 16'd70;
				ground2 = 16'd272  - 16'd70;
			end
			
			else if(prevX < 16'd1354)
			begin
				ground = 16'd349  - 16'd70;
			end
			
			else if(prevX < 16'd1455)
			begin
				ground  = 16'd349  - 16'd70;
				ground2 = 16'd272  - 16'd70;
			end
			
			else if(prevX < 16'd1823)
			begin
				ground = 16'd349 - (((prevX - 16'd1455) * 16'd64) / 16'd368)  - 16'd70;
			end
			
			else if(prevX < 16'd1999)
			begin
				ground = 16'd286 + (((prevX - 16'd1823) * 16'd26) / 16'd176)  - 16'd70;
			end
			
			else if(prevX < 16'd2134)
			begin
				ground = 16'd370 - 16'd70;
			end
			
			else if(prevX < 16'd2205)
			begin
				ground = 16'd370 + (((prevX - 16'd2134) * 16'd16) / 16'd71)  - 16'd70;
			end
			
			else if(prevX < 16'd2370)
			begin
				ground = 16'd386 - (((prevX - 16'd2205) * 16'd38) / 16'd165)  - 16'd70;
			end
			
			else if(prevX < 16'd2449)
			begin
				ground = 16'd348 + (((prevX - 16'd2370) * 16'd13) / 16'd79)  - 16'd70;
			end
			
			else if(prevX < 16'd2487)
			begin
				ground = 16'd600; // hole
			end
			
			else if(prevX < 16'd2846)
			begin
				ground = 16'd400 - 16'd70;
			end
			
			else if(prevX < 16'd3006)
			begin
				ground = 16'd463 - (((prevX - 16'd2846) * 16'd12) / 16'd160)  - 16'd70;
			end
			
			else if(prevX < 16'd3183)
			begin
				ground = 16'd455 - 16'd70;
			end
			
			if(prevY == ground || prevY == ground2)
			begin
				no = 4'd1;
			end
			
			
			if((DKmotion == 4'd4 || DKmotion == 4'd5) && (num <= 9) )
			begin
				Y = prevY - 16'd8;
			end
		
			else if(prevY == ground || prevY == ground2)
			begin
				Y = prevY;
				//no = 4'd1;
			end
		
			else 
			begin
				if(prevY <= (ground + 16'd2) && (prevY + 16'd8) >= ground)
					Y = ground;
				else if(prevY <= (ground2 + 16'd2)&& (prevY + 16'd8) >= ground2)
					Y = ground2;
				else
					Y = prevY + 16'd8;
			end
		end
		
		else
		begin
			X = prevX;
			Y = prevY;
		end
		
	end
end

endmodule
