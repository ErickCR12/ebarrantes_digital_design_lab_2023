module SistemaMantenimiento(
	input logic M, clk, rst,
	output reg [7:0] msg, cont_mant, cont_ciclos
);
	
	logic enable_mant, t0, rst_ciclos, mux_sel;
	reg [7:0] mux_out;
	
	
	//comparador si cont_ciclos es mayor a 200, resultado se almacena en t0
	comparador comp (
		cont_ciclos, 200,
		t0
	);

	//Máquina de estados responsable del control
	FSMmantenimiento FSM(
		M, t0, clk, rst,
		enable_mant, rst_ciclos, mux_sel
	);
	
	//contador de ciclos
	reg_ciclos ciclos (
		rst_ciclos, rst, clk,
		cont_ciclos
	);
	
	//contador de mant
	reg_mant mant (
		enable_mant, rst, clk,
		cont_mant
	);
	
	//Mux para escoger entre enable_mant o 0xFF según mux_sel
	mux1bit m (
		cont_mant, 8'b11111111, mux_sel,
		mux_out
	);
	
	//registro de mensaje
	reg_msg r_msg (
		mux_out, rst, clk,
		msg
	);
	
	
	
endmodule


//Multiplexor con linea de seleccion de un bit
module mux1bit(
	input reg[7:0] in0, input reg[7:0] in1, input sel,
	output reg[7:0] mux_out
);

	always @(in0, in1, sel)
		if (sel) mux_out = in1;
		else mux_out = in0;

endmodule


//comparador de op1 mayor que op2
module comparador (
	input reg[7:0] op1, op2,
	output mayor
);

	assign mayor = (op1 >= op2);

endmodule


//Registro para contar la cantidad de veces que se ha realizado el mantenimiento
module reg_mant(
	input enable_mant, rst, clk,
	output reg [7:0] cont_mant
);


	always_ff @(posedge clk or posedge rst)
		if (rst) cont_mant = 0;
		else if (enable_mant) cont_mant = cont_mant + 1;
	

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


//Registro de mensaje según linea de selección del MUX
module reg_msg(
	input reg [7:0] mux_out, input rst, input clk,
	output reg [7:0] msg
);

	always_ff @(posedge clk or posedge rst)
		if (rst) msg = 0;
		else msg = mux_out;
		
endmodule
