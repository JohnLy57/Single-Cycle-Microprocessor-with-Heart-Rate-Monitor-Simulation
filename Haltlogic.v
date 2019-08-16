module Haltlogic(HALT,EN_L,H,CLK);
	input HALT,CLK;
	input EN_L;
	output reg H;
	reg prevEN_L;
	
	always @(*) begin
		if (HALT)
			if (EN_L==0 && prevEN_L==1) begin
				H <= 1'b0;
			end
			else begin
				H <= 1'b1;
			end
		else
		H <= 1'b0;
	end
	always @(posedge CLK) begin
		prevEN_L <= EN_L;
	end
	
endmodule
		
			
