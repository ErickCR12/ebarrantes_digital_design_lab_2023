module decoBCD_tb();

	reg [3:0]in;
	reg [7:0]out; 
	
	decoBCD decoder(in,out);
	
	initial begin
	
	in = 4'b0000;
	#40
	in = 4'b1010;
	#40
	in = 4'b1011;
	#40
	in = 4'b1010;
	
	end
	
endmodule
