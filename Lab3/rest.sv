module rest(input A,
				input B,
				input bin,
				output D,
				output bout);
		
	always @(A or B or bin)
		begin
			D = A ^ B ^ bin;
			bout = (~A & B) | (~(A ^ B) & bin);
		end
endmodule