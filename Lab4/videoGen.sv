module videoGen(
	input logic [9:0] x, y, input reg[6:0] tablero [7:0][7:0], input reg[2:0] i_actual, j_actual, 
	input enable_derrota, enable_victoria,
	output logic [7:0] r, g, b
);
	logic inrect;
	
	parameter size = 10'd58;
	parameter frame = 10'd2;
	
	int colIndex, rowIndex, col_px, row_px;
	
	assign colIndex = x / (size+frame);
	assign rowIndex = y / (size+frame);
	
	assign col_px = colIndex*(size+frame);
	assign row_px = rowIndex*(size+frame);
	
	assign inrect = (colIndex < 8 && rowIndex < 8) && (x >= col_px+frame && x < col_px+size && y >= row_px+frame && y < row_px+size);
	
	
	always @* begin
		if (enable_derrota) begin
			{r, g, b} = {8'hFF, 8'h00, 8'h00};
		end else if (enable_victoria) begin
			{r, g, b} = {8'h00, 8'hFF, 8'h00};
		end else if (inrect) begin
			if(tablero[rowIndex][colIndex][5] == 1) begin
				{r, g, b} = {8'd255, 8'd128, 8'd0};
			end else if(tablero[rowIndex][colIndex][4] == 0) begin
				{r, g, b} = {8'hF0, 8'hF7, 8'hF5};
			end else begin
				case(tablero[rowIndex][colIndex][3:0])
					4'b0000: {r, g, b} = {8'd155, 8'd155, 8'd155};
					4'b0001: {r, g, b} = {8'd0, 8'd0, 8'd255};
					4'b0010: {r, g, b} = {8'd0, 8'd255, 8'd0};
					4'b0011: {r, g, b} = {8'd255, 8'd0, 8'd0};
					4'b0100: {r, g, b} = {8'd87, 8'd35, 8'd100};
					4'b0101: {r, g, b} = {8'd63, 8'd40, 8'd23};
					4'b0110: {r, g, b} = {8'd200, 8'd198, 8'd196};
					4'b0111: {r, g, b} = {8'd0, 8'd0, 8'd0};
					4'b1000: {r, g, b} = {8'd255, 8'd0, 8'd128};
					default: {r, g, b} = {8'd155, 8'd155, 8'd155};
				endcase
				
			end
		end else begin
			if (rowIndex == i_actual && colIndex == j_actual) begin
				{r, g, b} = {8'hFF, 8'h00, 8'h00};
			end else begin
				{r, g, b} = {8'h00, 8'h00, 8'h00};
			end
		end
	end
	
endmodule