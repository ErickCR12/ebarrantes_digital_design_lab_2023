module buscaminas (
	input logic iniciar, seleccionarCasilla, esArriba, esDerecha, esIzquierda, esAbajo, marcarBandera, clk, rst,
	input reg[5:0] cantBombas,
	output logic vgaclk,
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b
);

	reg clk_ms;
	reg [2:0] i_actual, j_actual;
	logic [3:0] state;
	reg[6:0] tablero [7:0][7:0];
	logic tableroGenerado, esVictoria, movimientoValido, bomba; //inputs para fsm
	logic enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera; //outputs de fsm
	reg [2:0] i_next, j_next;
	
	Clock_divider clkdiv (
		clk, clk_ms
	);
	
	comprobarBomba cb (
		tablero, i_actual, j_actual, seleccionarCasilla, clk_ms, rst,
		bomba
	);
	
	victory vict (
		cantBombas, tablero, clk_ms, rst,
		esVictoria
	);
	
	FSMbuscaminas fsm(
		iniciar, tableroGenerado, esVictoria, movimientoValido, seleccionarCasilla, bomba, marcarBandera, clk_ms, rst,
		enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera, state
	);
		
	
	registroTablero regtab(
		cantBombas, i_actual, j_actual, enable_matriz, enable_bandera, enable_casillas, clk_ms, rst,
		tablero, tableroGenerado
	);
	
	movement m(
		i_actual, j_actual, 
		esArriba, esDerecha, esIzquierda, esAbajo, clk_ms, rst,
		i_next, j_next, movimientoValido
	);
	
	cambiarIndices ci(
		i_next, j_next, enable_mov, clk_ms, rst,
		i_actual, j_actual
	);
	
	
	//Módulo para controlar el VGA y pintar el tablero en pantalla
	vga monitor(
		tablero, i_actual, j_actual, enable_victoria, enable_derrota, clk,
		vgaclk, hsync, vsync, sync_b, blank_b, r, g, b
	);
	

endmodule
