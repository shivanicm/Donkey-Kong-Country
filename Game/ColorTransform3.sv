module DK_Transform( input [3:0] in,
								output[15:0] out
							 );
//palette_hex = ['0x0EC9E0', '0x181004', '0xFFE7DE', '0xFFFFFF', '0x840404', '0xFF0404', '0xFF8473', '0x9C3104', '0xFFA594', '0xFFC6BD', '0x422104' , '0x633104', '0x8C4204', '0xAD5204', '0xC66304', '0xD67304']

	always @(in) // check 
	case(in)

		4'd0 :
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd49;
				out[4:0]   = 5'd27;
			end
		4'd1 :
			begin
				out[15:11] = 5'd2;
				out[10:5]  = 6'd3;
				out[4:0]   = 5'd0;
			end
			
		4'd2 :
			begin
				out[15:11] = 5'd31;
				out[10:5]  = 6'd57;
				out[4:0]   = 5'd26;
			end
			
		4'd3 :
			begin
				out[15:11] = 5'd31;
				out[10:5]  = 6'd63;
				out[4:0]   = 5'd31;
			end
			
		4'd4 :
			begin			
				out[15:11] = 5'd16;
				out[10:5]  = 6'd0;
				out[4:0]   = 5'd0;
			end
			
		4'd5 :
			begin
				out[15:11] = 5'd31;
				out[10:5]  = 6'd0;
				out[4:0]   = 5'd0;

			end
			
		4'd6 :
			begin			
				out[15:11] = 5'd31;
				out[10:5]  = 6'd32;
				out[4:0]   = 5'd13;

			end
			
		4'd7 :		//check
			begin
				out[15:11] = 5'd18;
				out[10:5]  = 6'd12;
				out[4:0]   = 5'd0;
			end
			
		4'd8 :		//check
			begin
				out[15:11] = 5'd31;
				out[10:5]  = 6'd40;
				out[4:0]   = 5'd17;
			end
			
		4'd9 :		//check
			begin
				out[15:11] = 5'd31;
				out[10:5]  = 6'd48;
				out[4:0]   = 5'd22;
			end
			
		4'd10 :		//check
			begin
				out[15:11] = 5'd8;
				out[10:5]  = 6'd8;
				out[4:0]   = 5'd0;
			end
			
		4'd11 :		//check
			begin
				out[15:11] = 5'd12;
				out[10:5]  = 6'd12;
				out[4:0]   = 5'd0;
			end
			
		4'd12 :		//check
			begin
				out[15:11] = 5'd17;
				out[10:5]  = 6'd16;
				out[4:0]   = 5'd0;
			end
			
		4'd13 :		//check
			begin
				out[15:11] = 5'd21;
				out[10:5]  = 6'd20;
				out[4:0]   = 5'd0;
			end
			
		4'd14 :		//check
			begin
				out[15:11] = 5'd24;
				out[10:5]  = 6'd24;
				out[4:0]   = 5'd0;
			end
			
		4'd15 :		//check
			begin
				out[15:11] = 5'd26;
				out[10:5]  = 6'd28;
				out[4:0]   = 5'd0;
			end

		
			default :	
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd49;
				out[4:0]   = 5'd27;
			end
		
	
	endcase
	
	endmodule
	