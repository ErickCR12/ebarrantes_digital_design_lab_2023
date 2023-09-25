module FSMbuscaminas(
	input iniciar, esVictoria, movimientoValido, seleccionarCasilla, bomba, marcarBandera, clk, rst,
	output enable_matriz, enable_victoria, enable_mov, enable_seleccion, enable_derrota, enable_casillas, enable_bandera,
	output logic [3:0] state
);

	logic [3:0] next_state;

	//actual state logic
	always_ff @(posedge clk or posedge rst)
		if (rst) state = 4'b0000;
		else state = next_state;
		
	//next state logic
	always_comb
		case(state)
			4'b0000: if(iniciar) next_state = 4'b0001; else next_state = 4'b0000;
			4'b0001: next_state = 4'b0010;
			4'b0010: if(esVictoria) next_state = 4'b0011; else next_state = 4'b0100;
			4'b0011: next_state = 4'b0011;
			4'b0100: if(movimientoValido) next_state = 4'b0101; else next_state = 4'b0110;
			4'b0101: next_state = 4'b0100;
			4'b0110: if(seleccionarCasilla) next_state = 4'b0111; else next_state = 4'b1010;
			4'b0111: if(bomba) next_state = 4'b1001; else next_state = 4'b1000;
			4'b1000: next_state = 4'b0010;
			4'b1001: next_state = 4'b1001;
			4'b1010: if(marcarBandera) next_state = 4'b1011; else next_state = 4'b0100;
			4'b1011: next_state = 4'b0010;
			default: next_state = 4'b0000;
		endcase
			
	//output logic
	assign enable_matriz 	= (state  == 4'b0001);
	assign enable_victoria	= (state  == 4'b0011);
	assign enable_mov		 	= (state  == 4'b0101);
	assign enable_seleccion	= (state  == 4'b0111);
	assign enable_casillas 	= (state  == 4'b1000);
	assign enable_derrota 	= (state  == 4'b1001);
	assign enable_bandera 	= (state  == 4'b1011);
		
endmodule