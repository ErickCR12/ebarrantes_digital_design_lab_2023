module movement_tb();
	reg [2:0] iactual;
	reg [2:0] jactual;
	reg [2:0] inext;
	reg [2:0] jnext;
	logic up;
	logic down;
	logic left;
	logic right;
	
	movement move(iactual, jactual, up, right, left, down, inext, jnext);
	
	initial begin
	jactual = 3'b001;
	iactual = 3'b010;
	up = 1;
	down = 0;
	left = 0;
	right = 0;
	#40
	jactual = 3'b001;
	iactual = 3'b010;
	up = 0;
	down = 1;
	left = 0;
	right = 0;
	#40
	jactual = 3'b001;
	iactual = 3'b010;
	up = 0;
	down = 0;
	left = 1;
	right = 0;
	#40
	jactual = 3'b001;
	iactual = 3'b010;
	up = 0;
	down = 0;
	left = 0;
	right = 1;
	#40
	jactual = 3'b000;
	iactual = 3'b000;
	up = 0;
	down = 1;
	left = 1;
	right = 0;
	#40
	jactual = 3'b111;
	iactual = 3'b111;
	up = 1;
	down = 0;
	left = 0;
	right = 1;
	end
endmodule
	