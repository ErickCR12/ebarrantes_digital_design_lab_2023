module decoBCD_tb();

	reg [3:0]in;
	reg [7:0]out;
	reg [3:0]sw;
	reg [8:0]sev;
	
	decoBCD decoder(in,out);
	sevenseg display(sw, sev);
	
	initial begin
	
	sw = 4'b0000;
	in = 4'b0000;
	#40
	sw = 4'b1101;
	in = 4'b0001;
	#40
	in = 4'b0010;
	#40
	in = 4'b0011;
	#40
	in = 4'b0100;
	#40
	in = 4'b1001;
	#40
	in = 4'b1010;
	#40
	in = 4'b1011;
	#40
	in = 4'b1100;
	
	end
	
endmodule
