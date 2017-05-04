module BGAddr(
						 input [9:0] DrawX,
						 input [9:0] DrawY,
						 input [15:0] outX,
						 output [22:0] out);
logic[18:0] newX, newY;
assign newX[9:0] = DrawX;
assign newY[9:0] = DrawY;

						 
always_comb
begin
	if(outX > 16'd2542)
	out = (newY * 23'd3182 + newX + 16'd2542);
	else
	out = (newY * 23'd3182 + newX + outX);
end

endmodule

	 //assign BG_temp_add = (DrawY * 23'd3182 + DrawX + outX);
