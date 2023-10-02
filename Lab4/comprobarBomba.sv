module comprobarBomba (
		input reg[6:0] tablero [7:0][7:0], input reg[2:0] i_actual, j_actual, input enable_seleccion, clk, rst,
		output bomba
);

	logic temp;
	always_ff @(negedge clk or negedge rst) begin
		if (!rst) temp = 0;
		else if (enable_seleccion)
			if (tablero[i_actual][j_actual][6] == 1'b1) temp = 1;
		else temp = 0;
	end
	
	assign bomba = temp;

endmodule