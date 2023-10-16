module binaryToBCD(
	input [5:0] bin,
   output reg [7:0] bcd
); 

	integer i;
	always @(bin) begin
		bcd=0;		 	
		for (i=0;i<6;i=i+1) begin
			if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;
			if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
			bcd = {bcd[6:0],bin[5-i]};
		end
	end
	
endmodule