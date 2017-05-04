module Candy(
				input [18:0] read_address,
				input Clk,
				output logic [3:0] data_Out
);

logic [3:0] mem [0:41580];

initial
begin
	 $readmemh("Candy.txt", mem);
end


always_ff @ (posedge Clk)
begin
	if(read_address < 0 || read_address > 19'd41580)
	data_Out<= mem[0];
	else
	data_Out<= mem[read_address];

	end

endmodule
