module SistemaMantenimiento_tb();

	// Señales de prueba
	logic [1:0] M, t0, clk, rst;
	reg [7:0] msg, cont_mant, cont_ciclos;
	
	always begin
		#20 clk = 1;
		#20 clk = 0;
	end
	
	// Instancia del gate AND
	
	SistemaMantenimiento sm (
		M, clk, rst,
		msg, cont_mant, cont_ciclos
	);
	
	
	// Simulación
	initial begin
	M = 0;
	t0 = 0;
	rst = 1;
	#80
	
	rst=0;
	
	#160
	
	M = 1;
	
	#40
	
	M = 0;
	
	#40
	
	M = 1;
	
	#40
	
	M = 0;
	
	#10000
	
	rst = 1;
	
	#40
	
	rst = 0;
	
	end

endmodule