module generador_aleatorio (
    input clk, rst, input reg[2:0] seed,
    output [2:0] rnd 
);

	wire feedback;
	reg[2:0] data;

	assign feedback = ~(rnd[2] ^ rnd[1]);

	always @(posedge clk, posedge rst) begin
		if (rst)
			data = seed;
		else
			data = {rnd[1:0],feedback};
	end

	assign rnd = data;

endmodule