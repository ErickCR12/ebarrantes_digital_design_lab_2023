module crearTablero(
	input reg [7:0] cantBombas, input enable_matriz, clk, rst,
	output reg [6:0] tablero [7:0][7:0], output reg [2:0] i_actual, output reg [2:0] j_actual
);

	reg [6:0] temp [7:0][7:0];
	reg [2:0] random_i, random_j;
	reg [7:0] cont;
	
	always_ff @(posedge clk or posedge rst) begin
		if (rst) cont = 8'b0;
		if (enable_matriz) begin
			if (cont < cantBombas) begin
				$random(seed);
				random_i = $urandom_range(7);
				random_j = $urandom_range(7);
				temp[random_i][random_j] = 7'b1000000;
			end
			cont <= cont + 1;
		end
	end
	
	assign tablero = temp;
	assign i_actual = 0;
	assign j_actual = 0;
	
	
	
endmodule