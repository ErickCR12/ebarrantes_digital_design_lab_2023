module shift_right #(parameter N = 2) (
	input reg [N-1:0] in,
	input integer amountShift,
	output reg [N-1:0] out
);

	always @(*) begin
		out = in;
		for(integer i = 0; i < N; i = i+1) begin
			if (i == amountShift)
				break;
			out = {1'b0, out[N-1:1]};
		end
	end
	
endmodule