module jumpMux (input [3:0] in1,
					 input [3:0] in2,
					 input [18:0] frame,
					 output [3:0] out);

	always_comb
	begin
		if(frame <= 19'd9)
			out = in1;
		else
			out = in2;
	end
					 
endmodule
