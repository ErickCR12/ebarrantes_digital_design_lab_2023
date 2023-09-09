module sum_tb();

	logic A;
	logic B;
	logic cin;
	wire suma;
	wire cout;
	
	sum Suma(A, B, cin, suma, cout);
		initial begin
			A = 1;
			B = 1;
			cin = 0;
			#40
			A = 0;
			B = 0;
			cin = 1;
			#40
			A = 1;
			B = 0;
			cin = 1;
			#40 
			A = 1;
			B = 1;
			cin = 1;
		end
endmodule
		
		