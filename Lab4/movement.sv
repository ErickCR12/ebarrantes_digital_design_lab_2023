module movement(
	input reg [2:0]i_actual, j_actual, 
	input logic isUp, isRight, isLeft, isDown, clk, rst,
	output reg [2:0]i_next, j_next
);
				
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			i_next = 0;
			j_next = 0;
		end else begin
			if(i_actual==3'b111 && isDown==1) i_next = i_actual;
			else if(i_actual==3'b000 && isUp==1) i_next = i_actual;
			else if(j_actual==3'b111 && isRight==1) j_next = j_actual;
			else if(j_actual==3'b000 && isLeft==1) j_next = j_actual;
			else begin
				if(isUp) i_next=i_actual - 1;
				if(isDown) i_next=i_actual + 1;
				if(isRight) j_next=j_actual + 1;
				if(isLeft) j_next=j_actual - 1;
			end
		end
	end 
					 
endmodule