module FSMbuscaminas_tb();

	logic iniciar, esVictoria, movimientoValido, seleccionarCasilla, bomba, marcarBandera, clk, rst,
			enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera;
			
	always begin
		#30 clk = 1;
		#30 clk = 0;
	end
	
	FSMbuscaminas fsm (
		iniciar, esVictoria, movimientoValido, seleccionarCasilla, bomba, marcarBandera, clk, rst,
		enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera
	);
	
	initial begin
		iniciar = 0;
		esVictoria = 0;
		movimientoValido = 0;
		seleccionarCasilla = 0;
		bomba = 0;
		marcarBandera = 0;
		rst = 1;
		#70
		
		rst = 0;
		iniciar = 1;
		esVictoria = 1;
		#250
		
		rst = 1;
		#250
		
		rst = 0;
		iniciar = 1;
		esVictoria = 0;
		movimientoValido = 1;
		#250
		
		movimientoValido = 0;
		marcarBandera = 1;
		#250
		
		marcarBandera = 0;
		seleccionarCasilla = 1;
		bomba = 0;
		#250
		
		seleccionarCasilla = 1;
		bomba = 1;
		#250
		
		seleccionarCasilla = 0;
		#500
		
		rst = 1;
	end	
	
endmodule