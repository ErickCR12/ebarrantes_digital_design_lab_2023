module rest_tb();
	logic A;
	logic B;
	logic bin;
	wire res;
	wire bout;
	
	sum Resta(A, ~B, bin, res, bout);
		initial begin
			A = 1;
			B = 1;
			bin = 1;
			#40
			A = 1;
			B = 0;
			bin = 1;
			#40
			A = 0;
			B = 1;
			bin = 1;
		end
endmodule