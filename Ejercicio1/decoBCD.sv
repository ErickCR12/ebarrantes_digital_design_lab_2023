module decoBCD(input reg[3:0]in, output reg [7:0]out);
						always @(in)
				begin
					if(in==4'b0000) out=8'b00000000;
					else if (in==4'b0001) out=8'b00000001;
					else if (in==4'b0010) out=8'b00000010;
					else if (in==4'b0011) out=8'b00000011;
					else if (in==4'b0100) out=8'b00000100;
					else if (in==4'b0101) out=8'b00000101;
					else if (in==4'b0110) out=8'b00000110;
					else if (in==4'b0111) out=8'b00000111;
					else if (in==4'b1000) out=8'b00001000;
					else if (in==4'b1001) out=8'b00001001;
					else if (in==4'b1010) out=8'b00010000;
					else if (in==4'b1011) out=8'b00010001;
					else if (in==4'b1100) out=8'b00010010;
					else if (in==4'b1101) out=8'b00010011;
					else if (in==4'b1110) out=8'b00010100;
					else if (in==4'b1111) out=8'b00010101;
				end

endmodule
