module muxCI(CISEL, CIout);
  
  // inputs
  input  CISEL;
  
  // outputs
  output CIout;

  // MUX LOGIC:
  //   if   CISEL == 0 => CIout = 0
  //   else            => CIout = 1
  assign CIout = (CISEL == 1'b0) ? 1'b0 : 1'b1;

endmodule