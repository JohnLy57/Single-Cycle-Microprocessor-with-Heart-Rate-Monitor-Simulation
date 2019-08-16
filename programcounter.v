module programcounter(CLK,RESET,PC,NextPC);

	input CLK,RESET;

	input [7:0] NextPC;

	output reg [7:0] PC; 


	always @ (posedge CLK) begin    //always block to keep track of and modify PC
		if(RESET) begin 
			PC <= 8'b00000000;
		end else begin
			PC <= NextPC;
		end
	end
endmodule