module death(input [15:0] Y,
				 output out);
				 
always_comb
begin
	if(Y >= 16'd600)
		out = 1'b1;
	else
		out = 1'b0;
end

endmodule
