module adderNbit #(parameter N = 4)(
	input wire [N-1:0] operand_a,
	input wire [N-1:0] operand_b,
	input wire carry_in,
	output wire [N-1:0] result,
	output wire carry_out
);

wire [N-1:0] carry;
wire [N-1:0] sum_temp;

genvar i;
generate
	for (i = 0; i < N; i = i + 1) begin : full_adder
		sum fullAdder_inst(
			.A(operand_a[i]),
			.B(operand_b[i]),
			.cin(i == 0 ? carry_in : carry[i-1]),
			.sum(sum_temp[i]),
			.cout(carry[i])
		);
	end
endgenerate

assign result[N-1:0] = sum_temp[N-1:0];
assign carry_out = carry[N-1];
	
endmodule