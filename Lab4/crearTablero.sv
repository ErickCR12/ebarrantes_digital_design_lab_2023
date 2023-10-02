module crearTablero(
	input reg [7:0] cantBombas, input enable_matriz, clk, rst,
	output reg [6:0] tablero [7:0][7:0], output tableroGenerado
);

	reg [6:0] temp [7:0][7:0];
	reg [2:0] random, i, j;
	reg [7:0] bomb_count;
	
	generador_aleatorio ga (
		clk, rst, cantBombas[2:0],
		random
	);

	always_ff @(posedge clk or posedge rst) begin
		if (rst) begin
			for(int i = 0; i < 8; i++)
				for(int j = 0; j < 8; j++)
					temp[i][j] = 7'b0000000;
			i = 0;
			j = 0;
			bomb_count = 0;
		end else if (enable_matriz) begin
			i = random + bomb_count + 4;
			j = random + bomb_count*2 + 2;
			temp[i][j][6] = 1'b1;
			bomb_count = bomb_count + 1;
		end
	end

	assign tablero = temp;
	assign tableroGenerado = (bomb_count >= cantBombas);
	
endmodule


