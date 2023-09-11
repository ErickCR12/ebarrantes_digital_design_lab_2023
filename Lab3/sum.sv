module sum(input A,
			  input B,
			  input cin,
			  output logic sum,
			  output logic cout);
	
	always @(A or B or cin)
		begin
         sum = A ^ B ^ cin;
         cout = A & B | (A ^ B) & cin;
		end
endmodule