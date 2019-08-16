module muxNextPC(PC, OFF, H, MP, NextPC);
  
  // inputs
  input [7:0] PC;
  input [7:0] OFF;
  input       H;
  input       MP;
  
  // outputs
  output [7:0] NextPC;
  
  assign NextPC = (H == 1'b1) ? PC : (MP == 1'b0) ? PC + 8'd2 : PC + 8'd2 + OFF;
  
endmodule