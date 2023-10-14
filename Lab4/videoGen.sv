module videoGen(
	input logic [9:0] x, y, input reg[6:0] tablero [7:0][7:0], input reg[2:0] i_actual, j_actual, 
	input enable_derrota, enable_victoria,
	output logic [7:0] r, g, b
);

	logic inrect, segmentA, segmentB, segmentC, segmentD, segmentE, segmentF, segmentG;
	
	parameter size = 10'd58;
	parameter frame = 10'd2;
	
	parameter numberSizeX = 10'd30;
	parameter numberSizeY = 10'd47;
	
	parameter numberFrameX = 10'd13;
	parameter numberFrameY = 10'd6;
	
	parameter segmentWidth = 10'd2;
	
	int colIndex, rowIndex, col_px, row_px;
	
	assign colIndex = x / (size+frame);
	assign rowIndex = y / (size+frame);
	
	assign col_px = colIndex*(size+frame);
	assign row_px = rowIndex*(size+frame);
	
	assign inrect = (colIndex < 8 && rowIndex < 8) && (x >= col_px+frame && x < col_px+size && y >= row_px+frame && y < row_px+size);
	
	
	assign segmentA = (x > col_px+frame+numberFrameX && x < col_px+frame+numberFrameX+numberSizeX) && 
							(y > row_px+frame+numberFrameY && y < row_px+frame+numberFrameY+segmentWidth);
							
	assign segmentB = (x > col_px+frame+numberFrameX+numberSizeX && x < col_px+frame+numberFrameX+numberSizeX+segmentWidth) && 
							(y > row_px+frame+numberFrameY && y < row_px+frame+numberFrameY+numberSizeY/2);
							
	assign segmentC = (x > col_px+frame+numberFrameX+numberSizeX && x < col_px+frame+numberFrameX+numberSizeX+segmentWidth) && 
							(y > row_px+frame+numberFrameY+numberSizeY/2 && y < row_px+frame+numberFrameY+numberSizeY);
							
	assign segmentD = (x > col_px+frame+numberFrameX && x < col_px+frame+numberFrameX+numberSizeX) && 
							(y > row_px+frame+numberFrameY+numberSizeY && y < row_px+frame+numberFrameY+numberSizeY+segmentWidth);
							
	assign segmentE = (x > col_px+frame+numberFrameX && x < col_px+frame+numberFrameX+segmentWidth) && 
							(y > row_px+frame+numberFrameY+numberSizeY/2 && y < row_px+frame+numberFrameY+numberSizeY);
	
	assign segmentF = (x > col_px+frame+numberFrameX && x < col_px+frame+numberFrameX+segmentWidth) && 
							(y > row_px+frame+numberFrameY && y < row_px+frame+numberFrameY+numberSizeY/2);
							
	assign segmentG = (x > col_px+frame+numberFrameX && x < col_px+frame+numberFrameX+numberSizeX) && 
							(y > row_px+frame+numberFrameY+numberSizeY/2 && y < row_px+frame+numberFrameY+numberSizeY/2+segmentWidth);
	
	
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
				{r, g, b} = {8'd155, 8'd155, 8'd155};
				case(tablero[rowIndex][colIndex][3:0])
					4'b0001: if(segmentB || segmentC) {r, g, b} = {8'd0, 8'd0, 8'd255};
					4'b0010: if(segmentA || segmentB || segmentD || segmentE || segmentG) {r, g, b} = {8'd0, 8'd255, 8'd0};
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