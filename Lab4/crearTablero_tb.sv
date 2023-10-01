module crearTablero_tb();

	reg [7:0] cantBombas; 
	reg enable_matriz, clk, rst;
	reg [6:0] tablero [7:0][7:0]; 
	reg [2:0] i_actual, j_actual;
		
	crearTablero ct(
		cantBombas, enable_matriz, clk, rst,
		tablero, i_actual, j_actual
	);
	
	always begin
		#5 clk = 1;
		#5 clk = 0;
	end

	initial begin
					
		cantBombas = 0;
		enable_matriz = 0;
		rst = 1;
		
		#20
		
		cantBombas = 10;
		enable_matriz = 1;
		rst = 0;

		#100
		
		enable_matriz = 0;
		
		$display("Matriz inicializada:");
		for (int i = 0; i < 8; i = i + 1)
			for (int j = 0; j < 8; j = j + 1) 
				$display("tablero[%0d][%0d] = %b", i, j, tablero[i][j]);
	
	end
endmodule