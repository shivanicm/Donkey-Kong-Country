module TextAddr(
						 input [9:0] DrawX,
						 input [9:0] DrawY,
						 input [18:0] framenum,
						 output [18:0] out);
logic[18:0] newX;
assign newX[9:0] = DrawX;

						 
always_comb
begin
	out = (((DrawX - 10'd580) * 19'd1 + (DrawY) * 19'd50) + (19'd2500 * framenum));
end

endmodule


