module generador_aleatorio (
    input clk, rst,
    output [2:0] rnd 
);

	reg [2:0] data_next, data;

   always_comb begin
      data_next = data;
      repeat(3) begin
         data_next = {(data_next[2]^data_next[0]), data_next[2:1]};
      end
   end

   always_ff @(posedge clk or posedge rst) begin
      if(rst)
         data <= 5'h1f;
      else
         data <= data_next;
   end
	
	assign rnd = data;
	
endmodule