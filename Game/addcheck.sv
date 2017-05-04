module addcheck(input [19:0] in,
					 output [9:0] X,
					 output [9:0] Y);
	always @(in)
	begin
		if(in < 20'd311296)
		begin
			X = ((in+4) % (20'd640));
			Y = ((in+4) / (20'd640));
		end
		else 
		begin
			X = 9'd0;
			Y = 9'd0;
			//X = ((in - 20'd311296) % (20'd640));
			//Y = ((in - 20'd311296) / (20'd640));
		end
	end		  
	
endmodule
