module victory_tb();

	reg [6:0] tab [7:0][7:0];
	reg [7:0]bombas;
	logic clk, rst, victor;
	
	victory win(bombas, tab, clk, rst, victor);
	
	always begin
		#5 clk = 0;
		#5 clk = 1;
	end
	
	initial begin
	 tab[0][0] = 7'b0010000;
    tab[3][4] = 7'b0010000;
	 tab[2][2] = 7'b0010000;
	 tab[1][3] = 7'b0010000;
	 tab[4][5] = 7'b0010000;
	 tab[6][0] = 7'b0010000;
	 bombas = 7'b0111010;
	 rst = 0;
	 #40
	 tab[0][0] = 7'b0010000;
    tab[3][4] = 7'b0010000;
	 tab[2][2] = 7'b0010000;
	 tab[1][3] = 7'b0010000;
	 tab[4][5] = 7'b0010000;
	 tab[6][0] = 7'b0010000;
	 tab[6][1] = 7'b0010000;
	 bombas = 7'b0111011;
	 rst = 0;
	 #40
	 tab[0][0] = 7'b0010000;
    tab[3][4] = 7'b0010000;
	 tab[2][2] = 7'b0010000;
	 tab[1][3] = 7'b0010000;
	 tab[4][5] = 7'b0010000;
	 tab[6][0] = 7'b0010000;
	 tab[6][1] = 7'b0010000;
	 bombas = 7'b0111001;
	 rst = 0;
	end
	
endmodule