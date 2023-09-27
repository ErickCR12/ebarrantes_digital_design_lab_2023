module movement(input reg [2:0]i_actual,
					 input reg [2:0]j_actual, 
					 input logic isUp, 
					 input logic isRight, 
					 input logic isLeft, 
					 input logic isDown,
					 output reg [2:0]i_next, 
					 output reg [2:0]j_next);
					 
		always @(i_actual, j_actual,isUp, isRight, isLeft, isDown)
				begin
					if(i_actual==3'b111 && isUp==1) i_next = i_actual;
					else if(i_actual==3'b000 && isDown==1) i_next = i_actual;
					else if(j_actual==3'b111 && isRight==1) j_next = j_actual;
					else if(j_actual==3'b000 && isLeft==1) j_next = j_actual;
					else if(isUp==1) i_next=i_actual + 1;
					else if(isDown==1) i_next=i_actual - 1;
					else if(isRight==1) j_next=j_actual + 1;
					else if(isLeft==1) j_next=j_actual - 1;
				end 
					 
endmodule