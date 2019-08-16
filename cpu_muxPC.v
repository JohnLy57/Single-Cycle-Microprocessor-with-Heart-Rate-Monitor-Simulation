module cpu_muxPC(PC,PC2,H,NextPC);

input  [7:0] PC,PC2;
input        H;
output [7:0] NextPC;

assign NextPC = (H==1'b0) ? PC2 : PC;

endmodule
