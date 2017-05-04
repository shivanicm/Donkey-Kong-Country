module Text(
				input [18:0] read_address,
				input Clk,
				output logic [2:0] data_Out
);

logic [2:0] mem [0:15000];

initial
begin
	 $readmemh("Text.txt", mem);
end


always_ff @ (posedge Clk)
begin
	if(read_address < 0 || read_address > 19'd15000)
	data_Out<= mem[0];
	else
	data_Out<= mem[read_address];

	end

endmodule
