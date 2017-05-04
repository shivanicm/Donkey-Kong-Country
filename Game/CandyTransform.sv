
module Candy_Transform( input [3:0] in,
								output[15:0] out
							 );
//000
//202008
//F8F8F8
//A04840
//501808
//E06858
//803008
//C84808
//F88870
//F8C098
//F8F860
//F890F8
//F850C0
//681848
//B83080

	always @(in) // check 
	case(in)

		4'd1 :
			begin
				out[15:11] = 5'd0;
				out[10:5]  = 6'd0;
				out[4:0]   = 5'd0;
			end
		4'd2 :
			begin
				out[15:11] = 5'd3;
				out[10:5]  = 6'd7;
				out[4:0]   = 5'd0;
			end
			
		4'd3 :
			begin
				out[15:11] = 5'd30;
				out[10:5]  = 6'd61;
				out[4:0]   = 5'd30;
			end
			
		4'd4 :
			begin
				out[15:11] = 5'd19;
				out[10:5]  = 6'd17;
				out[4:0]   = 5'd7;
			end
			
		4'd5 :
			begin			
				out[15:11] = 5'd9;
				out[10:5]  = 6'd5;
				out[4:0]   = 5'd0;
			end
			
		4'd6 :
			begin
				out[15:11] = 5'd27;
				out[10:5]  = 6'd25;
				out[4:0]   = 5'd10;

			end
			
		4'd7 :
			begin			
				out[15:11] = 5'd15;
				out[10:5]  = 6'd11;
				out[4:0]   = 5'd0;

			end
			
		4'd8 :		//check
			begin
				out[15:11] = 5'd24;
				out[10:5]  = 6'd17;
				out[4:0]   = 5'd0;
			end
			
		4'd9 :		//check
			begin
				out[15:11] = 5'd30;
				out[10:5]  = 6'd33;
				out[4:0]   = 5'd13;
			end
			
		4'd10 :		//check
			begin
				out[15:11] = 5'd30;
				out[10:5]  = 6'd47;
				out[4:0]   = 5'd18;
			end
			
		4'd11 :		//check
			begin
				out[15:11] = 5'd30;
				out[10:5]  = 6'd61;
				out[4:0]   = 5'd11;
			end
			
		4'd12 :		//check
			begin
				out[15:11] = 5'd30;
				out[10:5]  = 6'd35;
				out[4:0]   = 5'd30;
			end
			
		4'd13 :		//check
			begin
				out[15:11] = 5'd30;
				out[10:5]  = 6'd19;
				out[4:0]   = 5'd23;
			end
			
		4'd14 :		//check
			begin
				out[15:11] = 5'd12;
				out[10:5]  = 6'd5;
				out[4:0]   = 5'd8;
			end
			
		4'd15 :		//check
			begin
				out[15:11] = 5'd22;
				out[10:5]  = 6'd11;
				out[4:0]   = 5'd15;
			end
			
		4'd0 :		//check
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd49;
				out[4:0]   = 5'd27;
			end

		
			default :	
			begin
				out[15:11] = 5'd1;
				out[10:5]  = 6'd49;
				out[4:0]   = 5'd27;
			end
		
	
	endcase
	
	endmodule
	