module generador_aleatorio_tb();
	
	logic clk, rst;
	reg [2:0] rnd;
	
	always begin
		#30 clk = 1;
		#30 clk = 0;
	end
	
	generador_aleatorio ga (
		clk, rst,
		rnd
	);
	
	
	
	initial begin
		clk = 0;
		rst = 0;

		// Aplicar un reset inicial
		rst = 1;
		#60 rst = 0;

		// Realizar 20 ciclos de reloj y mostrar los valores aleatorios
		$display("Valor aleatorio:");
		for (int i = 0; i < 20; i = i + 1) begin
			#60 $display("%d", rnd);
		end
	

	end
endmodule