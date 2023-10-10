module videoGen(
	input logic [9:0] x, y, input reg[2:0] i_actual, j_actual,
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
	
	
	always @* begin
		if (inrect) begin
			if (rowIndex == i_actual && colIndex == j_actual) begin
				{r, g, b} = {8'hFF, 8'h00, 8'h00};
			end else begin
				{r, g, b} = {8'hF0, 8'hF7, 8'hF5};
			end 
		end else begin
			{r, g, b} = {8'h00, 8'h00, 8'h00};
		end
	end
	
endmodule