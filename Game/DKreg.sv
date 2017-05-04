//-------------------------------------------------------------------------
//      1-bit register                                                   --
//      Sai Ma                                                           --
//      11-13-2014                                                       --
//                                                                       --
//      For use with ECE 385 Final Project                     			 --
//      ECE Department @ UIUC                                            --
//-------------------------------------------------------------------------
module DKreg (input logic    Clk, Reset,
               input logic [15:0] smallD,
					input logic [15:0] bigD,
					output logic [15:0] smallD_out,
					output logic [15:0] bigD_out);

always_ff @ (posedge Clk or posedge Reset)
begin
	if (Reset)
	begin
		bigD_out <= 16'd10;
		smallD_out <= 16'd0;
	end
	else
	begin
		bigD_out <= bigD;
		smallD_out <= smallD;
	end
end
endmodule
