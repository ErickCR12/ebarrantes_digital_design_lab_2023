module victory(input reg[6:0] Cbombas, 
				   input reg[6:0] tablero [7:0][7:0],
					input clk, rst,
					output logic isVictory);			  
		
		reg [6:0] count;
		reg [6:0] elem;
		
		always_ff @(negedge clk or negedge rst) 
			begin
			count = 7'b0000000;
			if (!rst)
				begin
				isVictory = 0;
				end
			else
			begin
				for(int i = 0; i < 8; i = i + 1) begin
					for(int j = 0; j < 8; j = j + 1) begin
						elem = tablero[i][j];
						if(elem[4] == 0)
						begin
							count = count + 1;
						end
					end
				end
				if(count - 1 == Cbombas)
				begin
					isVictory = 1;
				end
				else
				begin
					isVictory = 0;
				end
			end
		   
			end
		
endmodule