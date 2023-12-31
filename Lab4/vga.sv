module vga(
	input reg[6:0] tablero [7:0][7:0], 
	input reg[2:0] i_actual, j_actual, 
	input enable_victoria, enable_derrota, clk,
	output logic vgaclk,
	output logic hsync, vsync,
	output logic sync_b, blank_b,
	output logic [7:0] r, g, b
);
	logic [9:0] x, y;
	pll vgapll(
		.inclk0(clk),
		.c0(vgaclk)
	);
	
	vgaController vgaCont(
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.sync_b(sync_b),
		.blank_b(blank_b),
		.x(x),
		.y(y)
	);
	
	videoGen vgavideoGen(
		.x(x),
		.y(y),
		.tablero(tablero),
		.i_actual(i_actual),
		.j_actual(j_actual),
		.enable_victoria(enable_victoria),
		.enable_derrota(enable_derrota),
		.r(r),
		.g(g),
		.b(b)
	);

endmodule