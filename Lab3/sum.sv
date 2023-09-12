module sum(input logic A,
			  input logic B,
			  input logic cin,
			  output logic sum,
			  output logic cout);
	
	always @(A or B or cin)
		begin
         sum = A ^ B ^ cin;
         cout = A & B | (A ^ B) & cin;
		end
endmodule