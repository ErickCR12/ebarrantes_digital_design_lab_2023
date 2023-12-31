module buscaminas (
	input logic iniciar, seleccionarCasilla, esArriba, esDerecha, esIzquierda, esAbajo, marcarBandera, clk, rst,
	input reg[5:0] cantBombas,
	output logic vgaclk,
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b,
	output reg [6:0] displayBombas0, displayBombas1, displayBanderas0, displayBanderas1
);

	reg clk_ms;
	reg [2:0] i_actual, j_actual;
	reg [5:0] cantBanderas;
	reg [7:0] cantBombasBCD;
	reg [7:0] cantBanderasBCD;
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
		enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera
	);
		
	
	registroTablero regtab(
		cantBombas, i_actual, j_actual, enable_matriz, enable_bandera, enable_casillas, clk_ms, rst,
		tablero, cantBanderas, tableroGenerado
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
	
	binaryToBCD bombasBCD(
		cantBombas,
		cantBombasBCD
	); 
	
	sevenSegmentsDeco bombasSeg0(
		cantBombasBCD[3:0],
		displayBombas0
	);
	
	sevenSegmentsDeco bombasSeg1(
		cantBombasBCD[7:4],
		displayBombas1
	);
	
	binaryToBCD banderasBCD(
		cantBanderas,
		cantBanderasBCD
	); 
	
	sevenSegmentsDeco banderasSeg0(
		cantBanderasBCD[3:0],
		displayBanderas0
	);
	
	sevenSegmentsDeco banderasSeg1(
		cantBanderasBCD[7:4],
		displayBanderas1
	);
	
endmodule