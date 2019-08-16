module muxB(BSEL, B, Bout);
	input 		BSEL;
	input [7:0]	B;
	
	output [7:0]Bout;
	
	wire  [7:0] notB=~B;
	
	assign Bout= (BSEL==1'b0)? B:notB;
endmodule
	
	