module shifter(A, LA, LR, Y, C); // add all inputs and outputs inside parentheses

  // inputs
	input [7:0] A;
	input			LA;//logical shift if 0 and arithmetic shift if 1
	input 		LR;//left if 0 and right if 1
  
  //there is no arithmetic left shift instruction, so when LR = 0, LA is ignored.
  
  // outputs
	output reg [7:0] Y;
	output reg		  C;

  // reg and internal variable definitions

  
  // implement module here

   always @(*) begin
		if (LR && !LA)begin
			//right logical 
			Y[7] <=1'b0 ;   
			Y[6] <= A[7];
			Y[5] <= A[6];
			Y[4] <= A[5];
			Y[3] <= A[4];
			Y[2] <= A[3];
			Y[1] <= A[2];
			Y[0] <= A[1];
			
			C <= A[0];
		end 
		else if (!LR && !LA)begin
				//left logical
			Y[7] <= A[6];   
			Y[6] <= A[5];
			Y[5] <= A[4];
			Y[4] <= A[3];
			Y[3] <= A[2];
			Y[2] <= A[1];
			Y[1] <= A[0];
			Y[0] <= 1'b0;
			
			C <= A[7];
		end
		else begin
		//right arithmetic
			Y[7] <= A[7] ;   
			Y[6] <= A[7];
			Y[5] <= A[6];
			Y[4] <= A[5];
			Y[3] <= A[4];
			Y[2] <= A[3];
			Y[1] <= A[2];
			Y[0] <= A[1];
			
			C <= A[0];
		end
	end
			
	
			
endmodule
