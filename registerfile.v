module registerfile(CLK,RESET,SA,SB,LD,DR,D_in,DataA,DataB);

input          RESET,CLK;
input   [2:0]  SA,SB,DR;
input             LD;
input   [7:0]  D_in;

output  [7:0]  DataA, DataB;

reg     [7:0]  register[0:7];
 


always @(posedge CLK)begin
	if (RESET) begin
		register[0] <= 8'b0;
		register[1] <= 8'b0;
		register[2] <= 8'b0;
		register[3] <= 8'b0;	
		register[4] <= 8'b0;
		register[5] <= 8'b0;
		register[6] <= 8'b0;
		register[7] <= 8'b0;
	end	
	else if (LD)
		register[DR] <= D_in;
	else begin
		register[0] <= register [0];
		register[1] <= register [1];
		register[2] <= register [2];
		register[3] <= register [3];
		register[4] <= register [4];
		register[5] <= register [5];
		register[6] <= register [6];
		register[7] <= register [7];
	end
end

assign DataA = register[SA];
assign DataB = register[SB];

endmodule 