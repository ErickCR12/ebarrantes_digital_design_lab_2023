module victory_tb();

	reg [6:0] tab [7:0][7:0];
	reg [7:0]bombas, count;
	logic clk, rst, victory;

	victory win(bombas, tab, clk, rst, victory);
	
	always begin
		#5 clk = 0;
		#5 clk = 1;
	end
	
	initial begin
		
		for(int i = 0; i < 8; i++)
			for(int j = 0; j < 8; j++)
				tab[i][j] = 7'b0000000;
		
		count = 0;	
		rst = 0;
		#20
		
		rst = 1;
		bombas = 8;
		tab[0][0] = 7'b1000000;
		tab[1][1] = 7'b1000000;
		tab[2][2] = 7'b1000000;
		tab[3][3] = 7'b1000000;
		tab[4][4] = 7'b1000000;
		tab[5][5] = 7'b1000000;
		tab[6][6] = 7'b1000000;
		tab[7][7] = 7'b1000000;
		#200
		
		for(int i = 0; i < 8; i++)
			for(int j = 0; j < 8; j++)
				if(tab[i][j][6] == 0) tab[i][j][4] = 1;
		
		#100
		
		for (int i = 0; i < 8; i = i + 1)
			for (int j = 0; j < 8; j = j + 1) 
				$display("tablero[%0d][%0d] = %b", i, j, tab[i][j]);
		
	end
	
endmodule