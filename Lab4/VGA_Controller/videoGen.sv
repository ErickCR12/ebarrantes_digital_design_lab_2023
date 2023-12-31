module videoGen(
	input logic [9:0] x, y,
	output logic [7:0] r, g, b
);
	logic inrect;
	
	parameter size = 10'd56;
	parameter frame = 10'd4;
	
	int colIndex, rowIndex, col_px, row_px;
	
	assign colIndex = x / (size+frame);
	assign rowIndex = y / (size+frame);
	
	assign col_px = colIndex*(size+frame);
	assign row_px = rowIndex*(size+frame);
	
	assign inrect = (colIndex < 8 && rowIndex < 8) && (x >= col_px && x < col_px+size && y >= row_px && y < row_px+size);
	
	assign {r, g, b} = inrect ? {8'h00, 8'hFF, 8'h00} : {8'h00, 8'h00, 8'h00};

	
	//assign inrect = (x >= width + frame & x < width - frame & y >= height + frame & y < height - frame);
	//assign {r, g, b} = inrect ? {8'hFF, 8'hFF, 8'hFF} : {8'h00, 8'h00, 8'h00};

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