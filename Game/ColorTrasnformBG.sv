

module ColorTransformBG( input [3:0] in,
								output[15:0] out
							 );

							 
							 
	always @(in) // check 
	case(in)

		4'd0 :
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd2;
				out[4:0]   = 5'd0;
			end
		4'd1 :
			begin
				out[15:11] = 5'd0;
				out[10:5]  = 6'd6;
				out[4:0]   = 5'd0;
			end
			
		4'd2 :
			begin
				out[15:11] = 5'd2;
				out[10:5]  = 6'd5;
				out[4:0]   = 5'd1;
			end
			
		4'd3 :
			begin
				out[15:11] = 5'd4;
				out[10:5]  = 6'd8;
				out[4:0]   = 5'd1;
			end
			
		4'd4 :
			begin			
				out[15:11] = 5'd18;
				out[10:5]  = 6'd12;
				out[4:0]   = 5'd2;
			end
			
		4'd5 :
			begin
				out[15:11] = 5'd6;
				out[10:5]  = 6'd8;
				out[4:0]   = 5'd1;

			end
			
		4'd6 :
			begin			
				out[15:11] = 5'd13;
				out[10:5]  = 6'd17;
				out[4:0]   = 5'd2;

			end
			
		4'd7 :		//check
			begin
				out[15:11] = 5'd23;
				out[10:5]  = 6'd32;
				out[4:0]   = 5'd6;
			end
			
		4'd8 :		//check
			begin
				out[15:11] = 5'd9;
				out[10:5]  = 6'd20;
				out[4:0]   = 5'd0;
			end
			
		4'd9 :		//check
			begin
				out[15:11] = 5'd7;
				out[10:5]  = 6'd19;
				out[4:0]   = 5'd5;
			end
			
		4'd10 :		//check
			begin
				out[15:11] = 5'd3;
				out[10:5]  = 6'd11;
				out[4:0]   = 5'd1;
			end
			
		4'd11 :		//check
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd15;
				out[4:0]   = 5'd0;
			end
			
		4'd12 :		//check
			begin
				out[15:11] = 5'd3;
				out[10:5]  = 6'd25;
				out[4:0]   = 5'd0;
			end
			
		4'd13 :		//check
			begin
				out[15:11] = 5'd8;
				out[10:5]  = 6'd52;
				out[4:0]   = 5'd0;
			end
			
		4'd14 :		//check
			begin
				out[15:11] = 5'd2;
				out[10:5]  = 6'd37;
				out[4:0]   = 5'd0;
			end
			
		4'd15 :		//check
			begin
				out[15:11] = 5'd10;
				out[10:5]  = 6'd2;
				out[4:0]   = 5'd3;
			//	out[15:11] = 5'd1;
			//	out[10:5]  = 6'd49;
			//	out[4:0]   = 5'd27;
				
			end

		
			default :	
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd49;
				out[4:0]   = 5'd27;
			end
		
	
	endcase
	
	endmodule
	