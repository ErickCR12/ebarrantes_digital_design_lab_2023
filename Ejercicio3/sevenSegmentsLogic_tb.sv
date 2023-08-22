module sevenSegmentsLogic_tb();

	reg[5:0] in;
	reg[6:0] out;
	
	sevenSegmentsLogic modulo(in, out);
	
	initial begin
		in = 6'b000001;
		#50;
		in = 6'b001010;
		#50;
		in = 6'b010100;
		#50;
		in = 6'b011110;
		#50;
		in = 6'b101000;
		#50;
		in = 6'b110010;
		#50;
		in = 6'b111111;
	end
endmodule