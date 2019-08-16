module bitadd(A, B, CI, Y, C); // add all inputs and outputs inside parentheses

  // inputs
  input  A;
  input  B;
  input  CI;
  
  // outputs
  output reg Y;
  output reg C;
  
  // reg and internal variable definitions
  
  // implement module here
	always @ (*) begin
		if (A & B) begin
			C <= 1'b1;
			if (CI)
				Y <= 1'b1;
			 else 
				Y <= 1'b0;
		end 
		
		
		else if (A | B) begin
			if (CI) begin
				Y <= 1'b0;
				C <= 1'b1;
			end 
			else begin
				Y <= 1'b1;
				C <= 1'b0;
			end
		end 
		
		else begin
			C <= 1'b0;
			if (CI)
				Y <= 1'b1;
			 else 
				Y <= 1'b0;
		end
	end	
  
endmodule