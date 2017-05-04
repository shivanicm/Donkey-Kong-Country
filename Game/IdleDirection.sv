module IdleDirection (input [9:0] DrawX,
							 input [9:0] DrawY,
							 input [9:0] DKX,
							 input [9:0] DKY,
							 input [15:0] outX,
							 input [18:0] framenum,
							 input [18:0] candy_frame,
							 input [3:0] motion,
							 output [18:0] out,
							 output [18:0] candy_out
);

logic[18:0] newX, newY;
assign newX[9:0] = DrawX;
assign newY[9:0] = DrawY;

always_comb
begin
	case(motion)
	
	
		4'd0 :	//IdleR
		begin
			if(outX > 16'd2542)
			out = (DrawX - (outX - 16'd2542) * 19'd1 + ((DrawY - DKY) * 19'd62) + (19'd6200 * framenum));
			else
			
			out = (((DrawX - DKX) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * framenum));
			candy_out = 19'd0;
		end
		
		4'd1 :	//IdleL
		begin
			if(outX > 16'd2542)
			out = (((16'd62 - (DrawX - (outX - 16'd2542))) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum)));
			else

			out = (((DKX - (DrawX - DKX)) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * framenum));
		   candy_out = 19'd0;
		end
		
		4'd2 : //WalkR
		begin
			if(framenum <= 19'd9)
				begin
					if(outX > 16'd2542)
					out = (DrawX - (outX - 16'd2542) * 19'd1 + ((DrawY - DKY) * 19'd62) + (19'd6200 * framenum));
					else
					out = (((DrawX - DKX) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * framenum));
					candy_out = 19'd0;
				end
			
			else	
				begin
					if(outX > 16'd2542)
					out = (((DrawX - (outX - 16'd2542)) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum - 19'd10)));
					else
					out = (((DrawX - DKX) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum - 19'd10)));
					
					candy_out = 19'd0;
				end
		end
		
		4'd3 :	//WalkL
		begin			
			if(framenum <= 19'd9)
				begin
					if(outX > 16'd2542)
					out = (((16'd62 - (DrawX - (outX - 16'd2542))) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum)));
					else
					out = (((DKX - (DrawX - DKX)) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum)));
					candy_out = 19'd0;
				end
			else	
				begin
						if(outX > 16'd2542)
					out = (((16'd62 - (DrawX - (outX - 16'd2542))) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * ((framenum - 19'd10))));

					else
					out = (((DKX - (DrawX - DKX)) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum - 19'd10)));
					candy_out = 19'd0;
				end
		end
		
		4'd4 : //JumpR
		begin
			if(framenum <= 19'd9)
				begin
					if(outX > 16'd2542)
					out = (((DrawX - (outX - 16'd2542)) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * framenum));
					else
					out = (((DrawX - DKX) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * framenum));
					candy_out = 19'd0;
				end
			else
				begin
					if(outX > 16'd2542)
					out = (((DrawX - (outX - 16'd2542)) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum - 19'd10)));
					else
					out = (((DrawX - DKX) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum - 19'd10)));
					candy_out = 19'd0;
				end
		end
		
		4'd5 :	//JumpL
		begin			
			if(framenum <= 19'd9)
				begin
					if(outX > 16'd2542)
					out = (((16'd62 - (DrawX - (outX - 16'd2542))) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum)));
					else
					out = (((DKX - (DrawX - DKX)) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum)));
					candy_out = 19'd0;
				end
			else	
				begin
					if(outX > 16'd2542)
					out = (((16'd62 - (DrawX - (outX - 16'd2542))) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * ((framenum - 19'd10))));
					else
					out = (((DKX - (DrawX - DKX)) * 19'd1 + (DrawY - DKY) * 19'd62) + (19'd6200 * (framenum - 19'd10)));
					candy_out = 19'd0;
				end
		end
		
		4'd6 :
		begin
			if(framenum <= 19'd9)
				begin
					if(outX > 16'd2542)
					out = (((DrawX - (outX - 16'd2542)) * 19'd1 + (DrawY - DKY) * 19'd80) + (19'd8000 * framenum));
					else
					out = (((DrawX - DKX) * 19'd1 + (DrawY - DKY) * 19'd80) + (19'd8000 * framenum));
					candy_out = (((DrawX-DKX ) * 19'd1 + (DrawY - DKY)* 19'd42) +(19'd3780 *candy_frame));
				end
			else	
				begin
					if(outX > 16'd2542)
					out = (((DrawX - (outX - 16'd2542)) * 19'd1 + (DrawY - DKY) * 19'd80) + (19'd8000 * (framenum - 19'd10)));
					else
					out = (((DrawX - DKX) * 19'd1 + (DrawY - DKY) * 19'd80) + (19'd8000 * (framenum - 19'd10)));
					candy_out = (((DrawX-DKX ) * 19'd1 + (DrawY - DKY)* 19'd42) +(19'd3780 *candy_frame));
				end
		end
		
		
		default :
		begin
			out = 19'd0;
			candy_out = 19'd0;
		end
		
	endcase
end
 endmodule
 