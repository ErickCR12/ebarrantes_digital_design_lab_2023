module buscaminas (
	input logic iniciar, seleccionarCasilla, esArriba, esDerecha, esIzquierda, esAbajo, marcarBandera, clk, rst,
	input reg[5:0] cantBombas,
	// output reg[6:0] tablero [7:0][7:0],
	output reg [2:0] i_actual, j_actual,
	output logic [3:0] state,
	output logic vgaclk,
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b
);
	
	reg[6:0] tablero [7:0][7:0];
	logic tableroGenerado, esVictoria, movimientoValido, bomba; //inputs para fsm
	logic enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera; //outputs de fsm
	reg [2:0] i_next, j_next;
	
	comprobarBomba cb (
		tablero, i_actual, j_actual, seleccionarCasilla, clk, rst,
		bomba
	);
	
	victory vict (
		cantBombas, tablero, clk, rst,
		esVictoria
	);
	
	FSMbuscaminas fsm(
		iniciar, tableroGenerado, esVictoria, movimientoValido, seleccionarCasilla, bomba, marcarBandera, clk, rst,
		enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera, state
	);
		
	
	registroTablero regtab(
		cantBombas, i_actual, j_actual, enable_matriz, enable_bandera, enable_casillas, clk, rst,
		tablero, tableroGenerado
	);
	
	movement m(
		i_actual, j_actual, 
		esArriba, esDerecha, esIzquierda, esAbajo, clk, rst,
		i_next, j_next, movimientoValido
	);
	
	cambiarIndices ci(
		i_next, j_next, enable_mov, clk, rst,
		i_actual, j_actual
	);
	
	
	//Módulo para controlar el VGA y pintar el tablero en pantalla
	vga monitor(
		tablero, i_actual, j_actual, enable_victoria, enable_derrota, clk,
		vgaclk, hsync, vsync, sync_b, blank_b, r, g, b
	);
	

endmodule
