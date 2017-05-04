module BananaNum (input [4:0] bi,
						output [2:0] deci);
						
always_comb
begin
	case(bi)
	
		5'b00000 : 
			deci = 3'd0;
	
		5'b00001 : 
			deci = 3'd1;
			
		5'b00010 : 
			deci = 3'd1;
			
		5'b00011 : 
			deci = 3'd2;
			
		5'b00100 : 
			deci = 3'd1;
			
		5'b00101 : 
			deci = 3'd2;
		
		5'b00110 : 
			deci = 3'd2;
			
		5'b00111 : 
		deci = 3'd3;
		
		5'b01000 : 
		deci = 3'd1;
		
		5'b01001 : 
		deci = 3'd2;
		
		5'b01010 : 
		deci = 3'd2;	

		5'b01011 : 
		deci = 3'd3;
			
		5'b01100 : 
		deci = 3'd2;
		
		5'b01101 : 
		deci = 3'd3;
		
		5'b01110 : 
		deci = 3'd3;
		
		5'b01111 : 
		deci = 3'd4;
		
		5'b10000 : 
		deci = 3'd1;
	
		5'b10001 : 
		deci = 3'd2;
			
		5'b10010 : 
		deci = 3'd2;
			
		5'b10011 : 
		deci = 3'd3;
		
		
		5'b10100 : 
			deci = 3'd2;
			
		5'b10101 : 
			deci = 3'd3;
		
		5'b10110 : 
			deci = 3'd3;
			
		5'b10111 : 
		deci = 3'd4;
		
		5'b11000 : 
		deci = 3'd2;
		
		5'b11001 : 
		deci = 3'd3;
		
		5'b11010 : 
		deci = 3'd3;	

		5'b11011 : 
		deci = 3'd4;
			
		5'b11100 : 
		deci = 3'd3;
		
		5'b11101 : 
		deci = 3'd4;
		
		5'b11110 : 
		deci = 3'd4;
		
		5'b11111 : 
		deci = 3'd5;
		
	endcase
end
						
endmodule
