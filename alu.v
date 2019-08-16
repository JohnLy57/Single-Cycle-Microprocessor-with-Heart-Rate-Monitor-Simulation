module alu(A, B, OP, Y, C, V, N, Z);
  input  [7:0]  A;
  input  [7:0]  B;
  input  [2:0]  OP;

  output [7:0]  Y;  //
  output reg      C;  //carry
  output reg      V;  //overflow
  output reg    N;  //negative
  output reg    Z;  //zero
	wire CISEL;
   wire BSEL;
	wire [1:0]OSEL;
	wire SHIFT_LA;
	wire SHIFT_LR;
	wire LOGICAL_OP;
	wire [7:0]Boutmux;
	wire CIoutmux;
	wire Cadder;
	wire cshift;
	wire [7:0]Yadd;
	wire [7:0]Yshift;
	wire [7:0]Ylogical;
	wire Vadd;
  // ADD YOUR CODE BELOW THIS LINE
  control control(
  .OP(OP), 
  .CISEL(CISEL), 
  .BSEL(BSEL), 
  .OSEL(OSEL), 
  .SHIFT_LA(SHIFT_LA), 
  .SHIFT_LR(SHIFT_LR), 
  .LOGICAL_OP(LOGICAL_OP)
   );
  
  muxB muxB(
  .BSEL(BSEL), 
  .B(B), 
  .Bout(Boutmux)
    );
	 
	muxCI CI(
	.CISEL(CISEL), 
	.CIout(CIoutmux)
	);
  
   adder adderUnit(
	  .A (A),
	  .B (Boutmux),
	  .Y (Yadd),
	  .C (Cadder),
	  .CI(CIoutmux),
	  .V (Vadd)            //Make V a reg just like C, N and Z if necessary
  );
  
	  shifter shiftunit(
			.A(A), 
			.LA(SHIFT_LA), 
			.LR(SHIFT_LR), 
			.Y(Yshift), 
			.C(cshift)  
	  );
	  
	  logical logicalunit(
			.A(A), 
			.B(Boutmux), 
			.OP(LOGICAL_OP), 
			.Y (Ylogical)
	  );
	  
	  
	  muxY mux(
			.ADDOUT(Yadd), 
			.SHIFTOUT(Yshift), 
			.LOGICOUT(Ylogical), 
			.OSEL(OSEL), 
			.Y(Y)
	  
	  
	  );
  
  
  always @ (*) begin
		if(Y[7] & 1'b1 == 1'b1) begin
			N <= 1'b1;
			Z <= 1'b0;
		end 
		else if (Y == 8'b0) begin
			N <= 1'b0;
			Z <= 1'b1;
		end 
		else begin
			Z <= 1'b0;
			N <= 1'b0;
		end
		if (OP==3'b000 || OP==3'b001)begin
			V <= Vadd;
			C<=Cadder;
		end
		else if(OP==3'b010 || OP==3'b011 || OP==3'b100)begin
			V <= 0;
			C<= cshift;
		end
		else begin
			V<=0;
			C<=0;
		end
  end
  // ADD YOUR CODE ABOVE THIS LINE

endmodule
