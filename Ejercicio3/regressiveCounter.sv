module regressiveCounter #(parameter N = 10)
	(input reg [N-1:0] in, input logic decrement, input logic reset,
	 output reg [N-1:0] out = in);
	
	reg [N-1:0] count = 0;
	always_ff @(posedge decrement or posedge reset) begin
		if (reset)	begin
			out <= in;
			count <= 0;
		end
      else begin
			out <= in - count;
			count <= count + 1;
		end
	end
	
endmodule