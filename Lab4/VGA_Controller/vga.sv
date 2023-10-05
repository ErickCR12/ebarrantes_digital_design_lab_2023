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
	
	logic pixel, inrect;
	// Given y position, choose a character to display
	// Then look up the pxel value from the character ROM
	// and dislpay in red or blue. Also, draw a green rectangle
	
	chargenrom chargenromb(y[8:3] + 8'd150, 10'd200, 10'd230, inrect);
	assign {r, b} = (y[3] == 0) ? {{8{pixel}}, 8'h00} : {8'h00, {8{pixel}}};
	assign g = inrect ? 8'hFF : 8'h00;
endmodule

module chargenrom(input logic [7:0] ch,
						input logic [2:0] xoff, yoff,
						output logic pixel);

	logic [5:0] charrom[2047:0];
	logic [7:0] line;
	initial
		$readmemb("charrom.txt", charrom);
	
	assign line = charrom[yoff + {ch - 65, 3'b000}];
	assign pixel = line[3'd7-xoff];
	
endmodule

module rectgen(input logic[9:0] x, y, left, top, right, bot,
					output logic inrect);

	assign inrect = (x >= left & x < right & y >= top & y < bot);
endmodule