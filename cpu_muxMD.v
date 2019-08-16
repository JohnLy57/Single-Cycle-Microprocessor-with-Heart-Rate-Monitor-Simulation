module cpu_muxMD(DataD,DataRAM,MD,D_in);

input  [7:0] DataD;
input  [7:0] DataRAM;
input        MD;

output [7:0] D_in;

assign D_in = (MD == 0) ? DataD:DataRAM;

endmodule
