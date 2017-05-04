

module Text_ColorTransform( input [2:0] in,
								output[15:0] out
							 );
//000
//#FFFBFF
//A54921
//633008
//EF6118
//FFFB00

always @(in) // check 
	case(in)

		3'd0 :
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd49;
				out[4:0]   = 5'd27;
			end
		3'd1 :
			begin
				out[15:11] = 5'd0;
				out[10:5]  = 6'd0;
				out[4:0]   = 5'd0;
			end
			
		3'd2 :
			begin
				out[15:11] = 5'd31;
				out[10:5]  = 6'd62;
				out[4:0]   = 5'd31;
			end
			
		3'd3 :
			begin
				out[15:11] = 5'd20;
				out[10:5]  = 6'd18;
				out[4:0]   = 5'd4;
			end
			
		3'd4 :
			begin			
				out[15:11] = 5'd12;
				out[10:5]  = 6'd11;
				out[4:0]   = 5'd0;
			end
			
		3'd5 :
			begin
				out[15:11] = 5'd31;
				out[10:5]  = 6'd62;
				out[4:0]   = 5'd0;

			end

		3'd6 :
			begin
				out[15:11] = 5'd29;
				out[10:5]  = 6'd23;
				out[4:0]   = 5'd2;

			end
			
				default :
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd49;
				out[4:0]   = 5'd27;
			end
	
	endcase
	
	endmodule
	