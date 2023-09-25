module shift_left_tb();

	reg[3:0] in, out;
	integer amount;
	
	shift_left #(4) modulo(in, amount, out);
	
	initial begin
		in = 4'b1101;
		amount = 3;
		#50
		
		in = 4'b0011;
		amount = 2;
		#50
		
		in = 4'b1111;
		amount = 5;
	end

endmodule