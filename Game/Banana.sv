module Banana(
				input [18:0] read_address,
				input Clk,
				output logic [2:0] data_Out
);

logic [2:0] mem [0:7168];

initial
begin
	 $readmemh("Banana.txt", mem);
end


always_ff @ (posedge Clk)
begin
	if(read_address < 0 || read_address > 19'd7168)
	data_Out<= mem[0];
	else
	data_Out<= mem[read_address];

	end

endmodule
