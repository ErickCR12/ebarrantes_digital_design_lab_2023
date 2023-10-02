module movement_tb();

	reg [2:0] iactual, jactual, inext, jnext;
	logic up, down, left, right, clk, rst, movimientoValido;
	
	always begin
		#5 clk = 0;
		#5 clk = 1;
	end
	
	movement move(iactual, jactual, up, right, left, down, clk, rst, inext, jnext, movimientoValido);
	
	initial begin
		rst = 1;
		iactual = 0;
		jactual = 0;
		up = 0;
		down = 0;
		left = 0;
		right = 0;
		#20
		
		rst = 0;	
		#20
		
		right = 1; //=>[0,1]
		#20
		
		right = 0;
		down = 1; //=>[1,0]
		#20
		
		down = 0;
		left = 1; //=>[0,0]
		#20
		
		left = 0;
		up = 1; //=>[0,0]
		#20
		
		up = 0;
		iactual = 7;
		jactual = 7;
		#20
		
		left = 1; //=>[7,6]
		#20
		
		left = 0;
		up = 1; //=>[6,7]
		#20
		
		up = 0;
		right = 1; //=>[7,7]
		#20
		
		right = 0;
		down = 1; //=>[7,7]
		#20
		
		down = 0;
		left = 1;
		up = 1; //=> [6,6]
		
		end
endmodule
	