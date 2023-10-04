module buscaminas_tb();

	logic iniciar, seleccionarCasilla, esArriba, esDerecha, esIzquierda, esAbajo, marcarBandera, clk, rst;
	logic [3:0] state;
	reg[7:0] cantBombas;
	reg[6:0] tablero [7:0][7:0];
	reg [2:0] i_actual, j_actual;

	buscaminas bm (
		iniciar, seleccionarCasilla, esArriba, esDerecha, esIzquierda, esAbajo, marcarBandera, clk, rst,
		cantBombas,
		tablero, i_actual, j_actual, state
	);
	
	always begin
		#5 clk = 1;
		#5 clk = 0;
	end
	
	initial begin
		iniciar = 0;
		seleccionarCasilla = 0;
		esArriba = 0;
		esDerecha = 0;
		esIzquierda = 0;
		esAbajo = 0;
		marcarBandera = 0;
		cantBombas = 0;
		rst = 0;
		#20
		
		rst=1;
		cantBombas = 10;
		iniciar = 1;
		#100
				
		esAbajo = 1;
		#10
		
		esAbajo = 0;
		esDerecha = 1;
		#140
		
		esDerecha = 0;
		seleccionarCasilla = 1;
		#100
		
		seleccionarCasilla = 0;
		esIzquierda = 1;
		#80
		
		esIzquierda = 0;
		seleccionarCasilla = 1;
		#60
		
		seleccionarCasilla = 0;
		esDerecha = 1;
		#20
		
		esDerecha = 0;
		marcarBandera = 1;
		#100
		
		marcarBandera = 0;
		seleccionarCasilla = 1;
		
		for (int i = 0; i < 8; i = i + 1)
			for (int j = 0; j < 8; j = j + 1) 
				$display("tablero[%0d][%0d] = %b", i, j, tablero[i][j]);
		
		
	end	
endmodule