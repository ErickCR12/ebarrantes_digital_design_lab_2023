module rest(input A,
				input B,
				input bin,
				output D,
				output bout);
		
	always @(A or B or bin)
		begin
			D = A ^ B ^ bin;
			bout = (~a & b) | (~(a ^ b) & bin);
		end
endmodule