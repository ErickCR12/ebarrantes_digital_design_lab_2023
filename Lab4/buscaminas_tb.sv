module buscaminas_tb();

	logic iniciar, seleccionarCasilla, esArriba, esDerecha, esIzquierda, esAbajo, marcarBandera, clk, rst;
	reg[7:0] cantBombas;
	reg[6:0] tablero [7:0][7:0];
	reg [2:0] i_actual, j_actual;

	buscaminas bm (
		iniciar, seleccionarCasilla, esArriba, esDerecha, esIzquierda, esAbajo, marcarBandera, clk, rst,
		cantBombas,
		tablero, i_actual, j_actual
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
		esDerecha = 1;
		#100
		
		esAbajo = 0;
		esDerecha = 0;
		iniciar = 0;
		rst = 0;
		#100
		
		rst = 1;
		cantBombas = 10;
		iniciar = 1;
		i_actual = 6;
		j_actual = 5;
		marcarBandera = 1;
		#1000
		
		for (int i = 0; i < 8; i = i + 1)
			for (int j = 0; j < 8; j = j + 1) 
				$display("tablero[%0d][%0d] = %b", i, j, tablero[i][j]);
		
		
	end	
endmodule