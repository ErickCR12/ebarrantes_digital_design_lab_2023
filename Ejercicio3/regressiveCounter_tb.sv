module regressiveCounter_tb();

	reg [3:0] in, out;
	logic decrement, reset;
	
	regressiveCounter #(4) modulo(in, decrement, reset, out);
	
	initial begin
	
	in = 4'b0100;
	decrement = 0;
	reset = 0;
	#100
	decrement = 1;
	#100
	decrement = 0;
	#100
	decrement = 1;
	#100
	decrement = 0;
	#100
	decrement = 1;
	#100
	decrement = 0;
	#100
	decrement = 1;
	#100
	decrement = 0;
	#100
	decrement = 1;
	#100
	decrement = 0;
	#100
	reset = 1;
	
	$display("Final: %b", out);
	
	end
	
endmodule

	