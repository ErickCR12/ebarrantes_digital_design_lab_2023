module registroTablero (
	input reg [5:0] cantBombas, input reg [2:0] i_actual, j_actual, input enable_matriz, enable_bandera, enable_casillas, clk, rst,
	output reg[6:0] tablero[7:0][7:0], output tableroGenerado
);

	reg [6:0] temp [7:0][7:0];
	reg [2:0] random, i, j;
	reg [5:0] bomb_count;
	
	generador_aleatorio ga (
		clk, rst, cantBombas[2:0],
		random
	);

	always_ff @(negedge clk or negedge rst) begin
		if (!rst) begin
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
		end else if (enable_bandera) begin
			temp[i_actual][j_actual][5] = 1'b1;
		end else if (tableroGenerado) begin
			for(int i = 0; i < 8; i = i + 1) begin
				for(int j = 0; j < 8; j = j + 1) begin
					temp[i][j][3:0] = 4'b0;
					for (int di = -1; di <= 1; di = di + 1) begin
						for (int dj = -1; dj <= 1; dj = dj + 1) begin
							if ((i + di >= 0) && (i + di < 8) && (j + dj >= 0) && (j + dj < 8))
								if (temp[i + di][j + dj][6] == 1'b1)
									temp[i][j][3:0] = temp[i][j][3:0] + 1;
						end
					end
				end
			end
			bomb_count = 0;
		end else if(enable_casillas) begin
			if(temp[i_actual][j_actual][3:0] != 0) temp[i_actual][j_actual][4] = 1'b1;
			else begin
				for (int di = -1; di <= 1; di = di + 1) begin
					for (int dj = -1; dj <= 1; dj = dj + 1) begin
						if ((i_actual + di >= 0) && (i_actual + di < 8) && (j_actual + dj >= 0) && (j_actual + dj < 8))
							temp[i_actual + di][j_actual + dj][4] = 1'b1;
					end
				end
			end
		end
	end


	assign tablero = temp;
	assign tableroGenerado = (bomb_count >= (cantBombas - 1));
	
endmodule

