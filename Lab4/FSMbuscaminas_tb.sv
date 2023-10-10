module FSMbuscaminas_tb();

	logic iniciar, tableroGenerado, esVictoria, movimientoValido, seleccionarCasilla, bomba, marcarBandera, clk, rst,
			enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera;
			
	always begin
		#30 clk = 1;
		#30 clk = 0;
	end
	
	FSMbuscaminas fsm (
		iniciar, tableroGenerado, esVictoria, movimientoValido, seleccionarCasilla, bomba, marcarBandera, clk, rst,
		enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera
	);
	
	initial begin
		iniciar = 0;
		tableroGenerado = 0;
		esVictoria = 0;
		movimientoValido = 0;
		seleccionarCasilla = 0;
		bomba = 0;
		marcarBandera = 0;
		rst = 0;
		#70
		
		rst = 1;
		iniciar = 1;
		tableroGenerado = 1;
		esVictoria = 1;
		#250
		
		rst = 0;
		iniciar = 0;
		tableroGenerado = 0;
		esVictoria = 0;
		#250
		
		rst = 1;
		iniciar = 1;
		#100
		
		tableroGenerado = 1;
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
		
		rst = 0;
	end	
	
endmodule