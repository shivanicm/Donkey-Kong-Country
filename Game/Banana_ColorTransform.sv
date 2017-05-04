

module Banana_ColorTransform( input [2:0] in,
								output[15:0] out
							 );
//0xA86838, 0x403004, 0x704804, 0xD89804, 0xF8D808
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
				out[15:11] = 5'd20;
				out[10:5]  = 6'd24;
				out[4:0]   = 5'd15;
			end
			
		3'd2 :
			begin
				out[15:11] = 5'd7;
				out[10:5]  = 6'd11;
				out[4:0]   = 5'd0;
			end
			
		3'd3 :
			begin
				out[15:11] = 5'd13;
				out[10:5]  = 6'd17;
				out[4:0]   = 5'd0;
			end
			
		3'd4 :
			begin			
				out[15:11] = 5'd26;
				out[10:5]  = 6'd37;
				out[4:0]   = 5'd0;
			end
			
		3'd5 :
			begin
				out[15:11] = 5'd30;
				out[10:5]  = 6'd53;
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
	