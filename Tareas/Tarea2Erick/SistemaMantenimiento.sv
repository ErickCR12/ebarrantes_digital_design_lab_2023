module SistemaMantenimiento(
	input logic M, clk, rst,
	output reg [7:0] msg, cont_mant, cont_ciclos
);
	
	logic [1:0] enable_mant, t0, rst_ciclos, mux_sel;
	
	//Máquina de estados responsable del control
	FSMmantenimiento FSM(
		M, t0, clk, rst,
		enable_mant, rst_ciclos, mux_sel
	);
	
	//registro de conteo ciclos
	reg_ciclos ciclos (
		rst_ciclos, rst, clk,
		cont_ciclos
	);
	
	//registro para conteo mant
	reg_mant mant (
		enable_mant, rst, clk,
		cont_mant
	);
	
	//comparador para t0 si cont_ciclos es igual a 200
	assign t0 = (cont_ciclos >= 200);
	
	//Registro de mensaje según linea de selección del MUX
	always_ff @(posedge clk or posedge rst)
		if (rst) msg = 0;
		else if (mux_sel) msg = 8'b11111111;
		else msg = cont_mant;
		
	
	
endmodule


//Registro para contar la cantidad de veces que se ha realizado el mantenimiento
module reg_mant(
	input enable_mant, rst, clk,
	output reg [7:0] cont_mant
);

	reg [31:0] temp_cont;

	always_ff @(posedge clk or posedge rst)
		if (rst) temp_cont = 0;
		else if (enable_mant) temp_cont = temp_cont + 1;
	
	assign cont_mant = temp_cont;

endmodule

//Registro para contar la cantidad de ciclos o resetear a cero la cantidad de ciclos
module reg_ciclos(
	input rst_ciclos, rst, clk,
	output reg [7:0] cont_ciclos
);
	
	always_ff @(posedge clk or posedge rst or posedge rst_ciclos)
		if (rst || rst_ciclos) cont_ciclos = 0;
		else cont_ciclos = cont_ciclos + 1;
		
endmodule
