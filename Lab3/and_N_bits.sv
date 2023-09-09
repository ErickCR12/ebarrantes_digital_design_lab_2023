module and_N_bits #(parameter N = 4) (
	input logic [N-1:0] operand_a,
	input logic [N-1:0] operand_b,
	output logic [N-1:0] out
);
   genvar i;
   generate
       for (i = 0; i < N; i=i+1) begin : AND_INSTANCES
           and1bit and_inst (
               .a(operand_a[i]),
               .b(operand_b[i]),
               .y(out[i])
           );
       end
   endgenerate
endmodule