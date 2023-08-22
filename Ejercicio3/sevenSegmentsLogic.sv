module sevenSegmentsLogic
	(input reg [5:0] in,
	 output reg [6:0] display2);
	 	 	 
	 assign a = in[5];
	 assign b = in[4];
	 assign c = in[3];
	 assign d = in[2];
	 assign e = in[1];
	 assign f = in[0];
	 
	 assign aSegment2 = ~b&c & (d|e) | a&~b&c | b&~c&~d & (~a|~e);
	 assign bSegment2 = a&b & (c|d|e);
	 assign cSegment2 = ~a&b & (~c&d | d&~e | c&~d);
	 assign dSegment2 = ~b&c & (d|e) | a&~b&c | b&~c&~d & (~a|~e);
	 assign eSegment2 = a & (~c|~d) | ~b&c & (e|d) | b&~c&~d | ~a&c&d&e;
	 assign fSegment2 = ~a&(b | c&e | c&d) | a&~b&~c;
	 assign gSegment2 = ~a&(~b | ~c&~d);
	 
	 assign display2 = {aSegment2, bSegment2, cSegment2, dSegment2, eSegment2, fSegment2, gSegment2};
	
endmodule
