module sum(input wire A,
			  input wire B,
			  input wire cin
			  output reg sum
			  output reg cout);
	
	always @(A or B or cin)
		begin
			sum = A ^ B ^ cin;
			cout = A&B | (A^B) & cin;
		end
	endmodule
		
			  