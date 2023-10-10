module videoGen(
	input logic [9:0] x, y,
	output logic [7:0] r, g, b
);
	logic pixel, inrect;
	
	parameter width = 10'd80;
	parameter height = 10'd60;
	parameter frame = 10'd2;
	
	assign inrect = (x >= width + frame & x < width - frame & y >= height + frame & y < height - frame);
	assign {r, g, b} = inrect ? {8'hFF, 8'hFF, 8'hFF} : {8'h00, 8'h00, 8'h00};

	/*
	rectgen videorectgen(
		.x(x),
		.y(y),
		.left(10'd120),
		.top(10'd150),
		.right(10'd200),
		.bot(10'd230),
		.inrect(inrect)
	);
	
	assign {r, b} = (y[3] == 0) ?  {{8{pixel}}, 8'h00} : {8'h00,{8{pixel}}};
	assign g = inrect ? 8'hFF : 8'h00;*/
endmodule