module registroTablero_tb();

	reg enable_matriz, enable_seleccion, enable_bandera, clk, rst, tableroGenerado;
	reg [2:0] i_actual, j_actual;
	reg [6:0] tablero [7:0][7:0]; 
	reg [7:0] cantBombas; 
		
	registroTablero regtab(
		cantBombas, i_actual, j_actual, enable_matriz, enable_seleccion, enable_bandera, clk, rst,
		tablero, tableroGenerado
	);
	
	always begin
		#5 clk = 1;
		#5 clk = 0;
	end

	initial begin
					
		tableroGenerado = 0;
		cantBombas = 0;
		i_actual = 0;
		j_actual = 0;
		enable_matriz = 0;
		enable_seleccion = 0;
		enable_bandera = 0;
		rst = 0;
		
		#20
		
		cantBombas = 10;
		enable_matriz = 1;
		rst = 1;

		#100
		
		enable_matriz = 0;
		i_actual = 6;
		j_actual = 5;
		enable_bandera = 1;
		#10
		
		$display("Matriz inicializada:");
		for (int i = 0; i < 8; i = i + 1)
			for (int j = 0; j < 8; j = j + 1) 
				$display("tablero[%0d][%0d] = %b", i, j, tablero[i][j]);
	
	end






endmodule
