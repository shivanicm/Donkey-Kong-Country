module Shock1(
				input [18:0] read_address,
				input Clk,
				output logic [3:0] data_Out
);

logic [3:0] mem [0:80000];

initial
begin
	 $readmemh("Shock0-9.txt", mem);
end


always_ff @ (posedge Clk)
begin
	if(read_address < 0 || read_address > 19'd80000)
	data_Out<= mem[0];
	else
	data_Out<= mem[read_address];

	end

endmodule
