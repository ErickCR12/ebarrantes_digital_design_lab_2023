module shift #(parameter N = 2) (
	input reg [N-1:0] in,
	input integer amountShift,
	input isLeft,
	output reg [N-1:0] out
);



endmodule

module shift_left #(parameter N = 2) (
	input reg [N-1:0] in,
	input integer amountShift,
	output reg [N-1:0] out
);

	always @(*) begin
		out = in;
		for(integer i = 0; i < amountShift; i = i+1)
			out = {out[N-2:0], 1'b0};
	end
	
endmodule

module shift_right #(parameter N = 2) (
	input reg [N-1:0] in,
	input integer amountShift,
	output reg [N-1:0] out
);

	always @(*) begin
		out = in;
		for(integer i = 0; i < amountShift; i = i+1)
			out = {1'b0, out[N-1:1]};
	end
	
endmodule

