module BananaAddr(input [15:0] X,
						 input [9:0] DrawX,
						 input [9:0] DrawY,
						 input [18:0] framenum,
						 output [18:0] out1,
						 output [18:0] out2,
						 output [18:0] out3,
						 output [18:0] out4,
						 output [18:0] out5);
logic[18:0] newX;
assign newX[9:0] = DrawX;

						 
always_comb
begin
	out1 = (((X + newX - 19'd943) * 19'd1 + (DrawY - 19'd255) * 19'd32) + (19'd1024 * framenum)); //(943,255) - bottom left 
	out2 = (((X + newX - 19'd1335) * 19'd1 + (DrawY - 19'd270) * 19'd32) + (19'd1024 * framenum)); //(1335,270)
	out3 = (((X + newX - 19'd1500) * 19'd1 + (DrawY - 19'd270) * 19'd32) + (19'd1024 * framenum)); //(1500,270)
	out4 = (((X + newX - 19'd2099) * 19'd1 + (DrawY - 19'd286) * 19'd32) + (19'd1024 * framenum)); //(2099,286)
	out5 = (((X + newX - 19'd2562) * 19'd1 + (DrawY - 19'd336) * 19'd32) + (19'd1024 * framenum)); //(2562,336)

end

endmodule


