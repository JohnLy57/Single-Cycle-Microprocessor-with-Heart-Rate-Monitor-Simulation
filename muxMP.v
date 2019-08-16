module muxMP(Z, N, BS, MP);
  
  // inputs
  input  Z;
  input  N;
  input [2:0] BS;
  
  // outputs
  output MP;

  assign MP = (BS == 3'b000) ? Z : (BS == 3'b001) ? ~Z : (BS == 3'b010) ? ~N : (BS == 3'b011) ? N : 1'b0;

endmodule