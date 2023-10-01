module vga(input logic clk,
			  output logic vgaclk,
			  output logic hsync, vsync,
			  output logic sync_b, blank_b,
			  output logic [7:0] r, g, b);

	logic [9:0] x, y;
	// Usar un PPL para crear el reloj de 25.175MHz
	// 25.175MHz clk period = 39.772 ns
	// La pantalla es de 800x600 pero solamente se ven 640x48R0
	// HSync = 1/(39.772 * 800) = 31.470kHz
	// VSync = 31.470kHz / 525 = 59.94 Hz (60 fps)
	
	pll pll_inst (
		.refclk   (clk),   //  refclk.clk
		.rst      (),      //   reset.reset
		.outclk_0 (vgaclk), // outclk0.clk
		.locked   ()    //  locked.export
	);
	
	// pll vgapll(.inclk0(clk), .c0(vgaclk));
	
	vgaController vgaCont(vgaClk, hsync, vsync, sync_b, blank_b, x, y);
	videoGen videoGen(x, y, r, g, b);
endmodule

module vgaController #(parameter HACTIVE = 10'd640,
							             HFP     = 10'd16,
											 HSYN    = 10'd96,
											 HBP     = 10'd48,
											 HMAX    = HACTIVE + HFP + HSYN + HBP,
											 VBP     = 10'd32,
											 VACTIVE = 10'd480,
											 VFP     = 10'd11,
											 VSYN    = 10'd2,
											 VMAX    = VBP + VACTIVE + VFP + VSYN)
								(input logic vgaclk,
								 output logic hsync, vsync, sync_b, blank_b,
								 output logic [9:0] x, y);
	
	always @(posedge vgaclk)
	begin
		x++;
		if(x == HMAX)
		begin
			x = 0;
			y++;
			if(y == VMAX) y = 0;
		end
	end
	
	assign hsync = ~(x >= HACTIVE + HFP & x < HACTIVE + HFP + HSYN);
	assign vsync = ~(y >= VACTIVE + VFP & y < VACTIVE + VFP + VSYN);
	assign sync_b = hsync & vsync;
	assign blank_b = (x < HACTIVE) & (y < VACTIVE);
	
endmodule

module videoGen(input logic [9:0] x, y,
					 output logic [7:0] r, g, b);

endmodule