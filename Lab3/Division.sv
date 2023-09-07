module Divsion #(parameter N = 4) (
	input [N-1:0] dividendo,
	input [N-1:0] divisor,
	output [N-1:0] cociente
);

	wire [N-1:0] residuo;
	wire [N-1:0] temp_dividendo;
	reg [N-1:0] temp_cociente;
	reg done;
	
	assign temp_dividendo = dividendo;
	assign done = 0;
	
	always @* begin
		if(temp_dividendo >= divisor) begin
			/*
				Aqui va la resta, algo como asi:
				resta #(N) resta_inst(
					.a(temp_dividendo),
					.b(divisor)
					.y(residuo)
				);
			*/
			
			temp_cociente = temp_cociente + 1'b1;
			temp_dividendo = residuo;
		end else begin
			done = 1;
		end
	end
	assign cociente = temp_cociente;
endmodule