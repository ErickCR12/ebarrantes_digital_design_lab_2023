module adderNbit_tb();
	parameter N = 4;
	reg[N-1:0] A, B;
	reg cin;
	
	wire [N:0] sum;
	wire cout;
	
	adderNbit #(N) uut(
		.operand_a(A),
		.operand_b(B),
		.carry_in(cin),
		.result(sum),
		.carry_out(cout)
	);

	initial begin
	
	A = 4'b0100;
	B = 4'b1000;
	cin = 1'b0;
	
	#20
	
	A = 4'b0010;
	B = 4'b1001;
	cin = 1'b0;
	
	#20
	
	A = 4'b0100;
	B = 4'b1100;
	cin = 1'b1;
	
	#20
	
	A = 4'b1000;
	B = 4'b1001;
	cin = 1'b1;
	
	end
endmodule