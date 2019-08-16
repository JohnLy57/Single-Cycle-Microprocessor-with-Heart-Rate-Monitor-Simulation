 module adder(A, B, CI, Y, C, V); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input      CI;
  
  // outputs
  output [7:0] Y;
  output       C;
  output reg   V;
    
  wire      C0Wire;
  wire      C1Wire;
  wire      C2Wire;
  wire      C3Wire;
  wire      C4Wire;
  wire      C5Wire;
  wire      C6Wire;
  
  // implement module here
	bitadd zeroth(         //zeroth bit
		.A(A[0]),
		.B(B[0]),
		.CI(CI),
		.C(C0Wire),
		.Y(Y[0])
	);
	
	bitadd first(      //first bit
		.A(A[1]),
		.B(B[1]),
		.CI(C0Wire),
		.C(C1Wire),
		.Y(Y[1])
	);
	
	bitadd second(     //second bit
		.A(A[2]),
		.B(B[2]),
		.CI(C1Wire),
		.C(C2Wire),
		.Y(Y[2])
	);
	
	bitadd third(    //third bit
		.A(A[3]),
		.B(B[3]),
		.CI(C2Wire),
		.C(C3Wire),
		.Y(Y[3])
	);
	
	bitadd fourth(      //fourth bit
		.A(A[4]),
		.B(B[4]),
		.CI(C3Wire),
		.C(C4Wire),
		.Y(Y[4])
	);
	
	bitadd fifth(      //fifth bit
		.A(A[5]),
		.B(B[5]),
		.CI(C4Wire),
		.C(C5Wire),
		.Y(Y[5])
	);
	
	bitadd sixth(      //sixth bit
		.A(A[6]),
		.B(B[6]),
		.CI(C5Wire),
		.C(C6Wire),
		.Y(Y[6])
	);
	
	bitadd seventh(     //seventh bit
		.A(A[7]),
		.B(B[7]),
		.CI(C6Wire),
		.C(C),
		.Y(Y[7])
	);
  
  
  	always @ (*) begin
		if (C6Wire == C) begin
			V <= 1'b0;
		end else begin
			V <= 1'b1;
		end
  end
  
endmodule
