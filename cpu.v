module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  wire [7:0] PC;
  wire [7:0] NextPC;
  wire MW;
    
  
  // ADD YOUR CODE BELOW THIS LINE
  wire [2:0] DR; 
  wire [2:0] SA;
  wire [2:0] SB;
  wire [5:0] IMM;
  wire       MB;
  wire [2:0] FS;
  wire       MD;
  wire       LD;
  wire [2:0] BS;
  wire [5:0] OFF;
  wire       HALT;
  wire [7:0] IMM_OUT;
  wire [7:0] B;
  wire       C,V,N,Z;
  wire 		 H;
  wire       MP;
  wire [7:0] OFF_mux;

	
	programcounter counter(
	.RESET(RESET),
	.CLK(CLK),
	.PC(PC),
	.NextPC(NextPC)
	);
	
   sign_xshift shift(
	.OFF_IN(OFF),
	.OFF_SHIFT(OFF_mux)
	);
	
	muxNextPC muxpc(
	.PC(PC), 
	.OFF(OFF_mux), 
	.H(H), 
	.MP(MP), 
	.NextPC(NextPC)
	);
	
	
   muxMP Branchselect(
	.Z(Z), 
	.N(N), 
	.BS(BS), 
	.MP(MP)
    );
  	    
	Haltlogic halt(
	.HALT(HALT),
	.EN_L(EN_L),
	.H(H),
	.CLK(CLK)
	);
  

	decoder deco(
	.INST(Iin), 
	.DR(DR),
	.SA(SA), 
	.SB(SB), 
	.IMM(IMM), 
	.MB(MB), 
	.FS(FS), 
	.MD(MD), 
	.LD(LD), 
	.MW(MW), 
	.BS(BS),
	.OFF(OFF),
	.HALT(HALT)
	);
	
	registerfile regfile(
	.CLK(CLK),
	.RESET(RESET),
	.SA(SA),
	.SB(SB),
	.LD(LD),
	.DR(DR),
	.D_in(DataC),
	.DataA(DataA),
	.DataB(DataB)
	);
	
	sign_extend sext(
	.IMM_IN(IMM),
	.IMM_OUT(IMM_OUT)
	);
	
	cpu_muxMB muxMB(
	.DataB(DataB),
	.IMM(IMM_OUT),
	.MB(MB),
	.MBOUT(B)
	);
	
	alu alu(
	.A(DataA), 
	.B(B),
	.OP(FS), 
	.Y(DataD), 
	.C(C), 
	.V(V), 
	.N(N), 
	.Z(Z)
	);
	
	cpu_muxMD muxMD(
	.DataD(DataD),
	.DataRAM(Din),
	.MD(MD),
	.D_in(DataC)
   );
    

  // ADD YOUR CODE ABOVE THIS LINE

endmodule
