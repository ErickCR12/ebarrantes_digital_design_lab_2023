module victory(input reg[7:0] Cbombas, 
				   input reg[6:0] tablero [7:0][7:0],
					input clk, rst,
					output logic isVictory, output reg[7:0] count);			  
		
		
		always_ff @(negedge clk or negedge rst) begin
			if (!rst) begin
				isVictory = 0;
				count = 0;
			end else begin
				count = 0;
				for(int i = 0; i < 8; i = i + 1) begin
					for(int j = 0; j < 8; j = j + 1) begin
						if(tablero[i][j][4] == 0) count = count + 1;
					end
				end
				if(count == Cbombas) isVictory = 1;
				else isVictory = 0;
			end   
		end
				
endmodule