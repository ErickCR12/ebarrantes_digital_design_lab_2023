module FSMmantenimiento(
	input logic M, t0, clk, rst,
	output logic enable_mant, rst_ciclos, mux_sel
);
	
	logic [1:0] state, next_state;
	
	//actual state logic
	always_ff @(posedge clk or posedge rst)
		if(rst) state = 2'b00;
		else state = next_state;
	
	//next state logic
	always_comb
		case(state)
			2'b00: if (M) next_state = 2'b01; else next_state = 2'b10;
			2'b01: next_state = 2'b00;
			2'b10: if (t0) next_state = 2'b11; else next_state = 2'b00;
			2'b11: next_state = 2'b11;
			default: next_state = 2'b00;
		endcase
	
		
	//output logic
	assign enable_mant = (state == 2'b01);
	assign rst_ciclos = (state == 2'b01);
	assign mux_sel = (state == 2'b11);
	
	
endmodule