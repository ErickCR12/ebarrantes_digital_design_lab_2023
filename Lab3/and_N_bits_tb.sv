module and_N_bits_tb;
	// Parámetros
	parameter N = 4;
	
	// Señales de prueba
	logic [N-1:0] a, b;
	logic res;
	
	// Instancia del gate AND
	
	and_N_bits dut (
		.operand_a(a),
		.operand_b(b),
		.out(res)
	);
	// Simulación
	initial begin
	a = 4'b0101;
	b = 4'b1011;
	#10
	
	a = 4'b1101;
	b = 4'b1011;
	#10
	
	a = 4'b0000;
	b = 4'b1111;
	#10
	
	a = 4'b1111;
	b = 4'b1111;
	
	end
	
endmodule
