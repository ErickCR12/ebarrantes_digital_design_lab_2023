module shift_right_tb();

	reg[3:0] in, out;
	integer amount;
	
	shift_right #(4) modulo(.in(in), .amountShift(amount), .out(out));
	
	initial begin
		in = 4'b1101;
		amount = 3;
		#50
		
		in = 4'b1100;
		amount = 2;
		#50
		
		in = 4'b1111;
		amount = 5;
	end

endmodule