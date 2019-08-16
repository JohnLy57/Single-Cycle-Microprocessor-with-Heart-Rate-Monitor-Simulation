module decoder(INST, DR, SA, SB, IMM, MB, FS, MD, LD, MW, BS, OFF, HALT);

  output  reg [2:0]  DR;
  output  reg [2:0]  SB;
  output  reg [2:0]  SA;
  output  reg [5:0]  IMM;
  output  reg        MB;
  output  reg [2:0]  FS; 
  output  reg        MD;
  output  reg        LD;
  output  reg        MW; 
  output  reg        HALT;
  output  reg [2:0]  BS;  
  output  reg [5:0]  OFF;
  
  input   [15:0] INST;
  
  reg [2:0] FUNCT;
  reg [2:0] RD;
  reg [2:0] RT;
  reg [2:0] RS;
  reg [3:0] OP;
  
  
//  assign x = statement ? case1 : case2;
  
  // ADD YOUR CODE BELOW THIS LINE
  always @ (*) begin    //breaking down of instruction input

		OP<=INST [15:12]; 
		RS<= INST [11:9];
		RT<=INST [8:6];
		
		if (OP == 4'b0000 || OP == 4'b1111) begin
			RD<=INST [5:3];
			FUNCT<=INST[2:0];
			IMM<=0;
		end else begin
			RD<=3'b000;
			FUNCT<=3'b000;
			IMM[5]<=INST[5];
			IMM[4]<=INST[4];
			IMM[3]<=INST[3];
			IMM[2]<=INST[2];
			IMM[1]<=INST[1];
			IMM[0]<=INST[0];
		end	

		
        //decoding logic
		if (OP == 4'b0000 && FUNCT==3'b001) begin //HALT
			DR <= 3'b0;
			SA <= 3'b0;
			SB <= 3'b0;
			MB <= 1'b0;
			FS <= 3'b0;
			MD <= 1'b0;
			LD <= 1'b0;
			MW <= 1'b0;
			BS<= 3'b100;
			OFF<=6'b0;
			HALT <= 1'b1;	
		end else if (OP == 4'b0010) begin //LB
			DR <= RT;
			SA <= RS;
			SB <= 3'b0;
			MB <= 1'b1;
			FS <= 3'b000;
			MD <= 1'b1;
			LD <= 1'b1;
			MW <= 1'b0;
			BS <= 3'b100;
			OFF<=6'b0;
			HALT<=1'b0;
		end else if (OP == 4'b0100) begin // SB
			DR <= 3'b0;
			SA <= RS;
			SB <= RT;
			MB <= 1'b1;
			FS <= 3'b000;
			MD <= 1'b0;
			LD <= 1'b0;
			MW <= 1'b1;
			BS <= 3'b100;
			OFF<=6'b0;
			HALT<=1'b0;
		end else if (OP == 4'b0101) begin // ADDI
			DR <= RT;
			SA <= RS;
			SB <= 3'b0;
			MB <= 1'b1;
			FS <= 3'b000;
			MD <= 1'b0;
			LD <= 1'b1;
			MW <= 1'b0;
			BS <= 3'b100;
			OFF<=6'b0;
			HALT<=1'b0;	
		end else if (OP == 4'b0110) begin//ANDI
			DR <= RT;
			SA <= RS;
			SB <= 3'b0;
			MB <= 1'b1;
			FS <= 3'b101;
			MD <= 1'b0;
			LD <= 1'b1;
			MW <= 1'b0;
			BS <= 3'b100;
			OFF<=6'b0;
			HALT<=1'b0;	
		end else if (OP == 4'b0111) begin //ORI
			DR <= RT;
			SA <= RS;
			SB <= 3'b0;
			MB <= 1'b1;
			FS <= 3'b110;
			MD <= 1'b0;
			LD <= 1'b1;
			MW <= 1'b0;
			BS <= 3'b100;
			OFF<=6'b0;
			HALT<=1'b0;		
		end else if (OP == 4'b1111) begin 
			DR <= RD;
			SA <= RS;
			SB <= 3'b0;
			MB <= 1'b0;
			MD <= 1'b0;
			LD <= 1'b1;
			MW <= 1'b0;
			BS <= 3'b100;
			OFF<=6'b0;
			HALT<=1'b0;
			if (FUNCT == 3'b000) begin   //ADD
				FS <= 3'b000; SB <= RT;
			end else if (FUNCT == 3'b001) begin  //SUB
				FS <= 3'b001; SB <= RT;
			end else if (FUNCT == 3'b010) begin  //SRA
				FS <= 3'b010;
			end else if (FUNCT == 3'b011) begin  //SRL
				FS <= 3'b011;			
			end else if (FUNCT == 3'b100) begin  //SLL
				FS <= 3'b100;
			end else if (FUNCT == 3'b101) begin  //AND
				FS <= 3'b101; SB <= RT;
			end else if (FUNCT == 3'b110) begin  //OR
				FS <= 3'b110; SB <= RT;
			end else begin  // to prevent inferred latches
				FS <= 3'b111;
			end
		end else if(OP == 4'b1000) begin  //BEQ
			DR <= 3'b0; 
			SA <= RS;
			SB <= RT;
			MB <= 1'b0;
			FS <= 3'b001;
			MD <= 1'b0;
			LD <= 1'b0;
			MW <= 1'b0;	
			HALT <= 1'b0;
			BS <= 3'b000;
			OFF <= INST[5:0];	
		end else if(OP == 4'b1001) begin   //BNE
			DR <= 3'b0;
			SA <= RS;
			SB <= RT;
			MB <= 1'b0;
			FS <= 3'b001;
			MD <= 1'b0;
			LD <= 1'b0;
			MW <= 1'b0;	
			HALT <= 1'b0;
			BS <= 3'b001;
			OFF <= INST[5:0];		
		end else if(OP == 4'b1010) begin  //BGEZ
			DR <= 3'b0;
			SA <= RS;
			SB <= 3'b0;  
			IMM<=0;
			MB <= 1'b1;  
			FS <= 3'b001;
			MD <= 1'b0;
			LD <= 1'b0;
			MW <= 1'b0;	
			HALT <= 1'b0;
			BS <= 3'b010;
			OFF <= INST[5:0];		
		end else if(OP == 4'b1011) begin   //BLTZ
			DR <= 3'b0;
			SA <= RS;
			SB <= 3'b0;
			IMM<=0;
			MB <= 1'b1;
			FS <= 3'b001;
			MD <= 1'b0;
			LD <= 1'b0;
			MW <= 1'b0;	
			HALT <= 1'b0;
			BS <= 3'b011;
			OFF <= INST[5:0];	
		end else begin    //to prevent inferred latches
			DR <= 3'b000;
			SA <= 3'b000;
			SB <= 3'b000;
			IMM<=0;
			MB <= 1'b0;
			FS <= 3'b000;
			MD <= 1'b0;
			LD <= 1'b0;
			MW <= 1'b0;	
			BS <= 3'b000;
			OFF<=6'b0;
			HALT<=1'b0;
		end
  end
endmodule
