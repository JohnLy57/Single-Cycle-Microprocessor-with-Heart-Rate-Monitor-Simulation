// Prelab 5b test

// sets the granularity at which we simulate
`timescale 1 ns / 1 ps

// name of the top-level module; for us it should always be <module name>_test
// this top-level module should have no inputs or wires; only internal signals are needed
module decoder_test();

  // for all of your input pins, declare them as type reg, and name them identically to the pins
  reg  [15:0] INST;
  
  // for all of your wire pins, declare them as type wire so ModelSim can display them
  wire [2:0]  DR;
  wire [2:0]  SA;
  wire [2:0]  SB;
  wire [5:0]  IMM;
  wire		    MB;
  wire [2:0]  FS;
  wire 		    MD;
  wire		    LD;
  wire		    MW;
  
  reg  [2:0]  DR_REF;
  reg  [2:0]  SA_REF;
  reg  [2:0]  SB_REF;
  reg  [5:0]  IMM_REF;
  reg 		    MB_REF;
  reg  [2:0]  FS_REF;
  reg  		    MD_REF;
  reg 		    LD_REF;
  reg 		    MW_REF;
  
  decoder dec(
      .INST(INST),
      .DR(DR),
      .SA(SA),
      .SB(SB),
      .IMM(IMM),
      .MB(MB),
      .FS(FS),
      .MD(MD),
      .LD(LD),
      .MW(MW)
  );
  
  // variables for tracking stats
  integer totalTests;
  integer numTestsFailed;
  
  // TEST CASES: add your test cases in the block here
  // REMEMBER: separate each test case by delays that are multiples of #100, so we can see
  //    the output for at least one cycle (since we chose a 10 MHz clock)
  initial
  begin
    
    numTestsFailed = 0;
    totalTests = 0;
    #100;
    
    //-------------------------------------------------------------------
    // Test #1
    //-------------------------------------------------------------------
    INST =    16'b0;
    DR_REF =  3'b0;
    SA_REF =  3'b0;
    SB_REF =  3'b0;
    IMM_REF = 6'b0;
    MB_REF =  1'b0;
    FS_REF =  3'b0;
    MD_REF =  1'b0;
    LD_REF =  1'b0;
    MW_REF =  1'b0;
    
    #100;
  
    $display("MSIM> ");
    $display("MSIM> #%2d", totalTests);
    
    // print a different message depending on whether this is a
    // register-to-register (r2r) or immediate (imm) instruction
    if (INST[15] == 1)
      $display("MSIM> INST = [%4b][%3b][%3b][%3b][%3b] (r2r)", INST[15:12], INST[11:9], INST[8:6], INST[5:3], INST[2:0]);
    else
      $display("MSIM> INST = [%4b][%3b][%3b][%6b] (imm)", INST[15:12], INST[11:9], INST[8:6], INST[5:0]);
    
    $display("MSIM>   DR  = %3b\t\t\t[%s]", DR, DR==DR_REF ? " OK " : "FAIL");
    $display("MSIM>   SA  = %3b\t\t\t[%s]", SA, SA==SA_REF ? " OK " : "FAIL");
    $display("MSIM>   SB  = %3b\t\t\t[%s]", SB, SB==SB_REF ? " OK " : "FAIL");
    $display("MSIM>   IMM = %6b\t\t[%s]",   IMM, IMM==IMM_REF ? " OK " : "FAIL");
    $display("MSIM>   MB  = %1b\t\t\t[%s]", MB, MB==MB_REF ? " OK " : "FAIL");
    $display("MSIM>   MB  = %3b\t\t\t[%s]", FS, FS==FS_REF ? " OK " : "FAIL");
    $display("MSIM>   MB  = %1b\t\t\t[%s]", MD, MD==MD_REF ? " OK " : "FAIL");
    $display("MSIM>   MB  = %1b\t\t\t[%s]", LD, LD==LD_REF ? " OK " : "FAIL");
    $display("MSIM>   MB  = %1b\t\t\t[%s]", MW, MW==MW_REF ? " OK " : "FAIL");
    
    if((DR!=DR_REF) || (SA!=SA_REF) || (SB!=SB_REF) || (IMM!=IMM_REF) ||
       (MB!=MB_REF) || (FS!=FS_REF) || (MD!=MD_REF) || (LD!=LD_REF) || (MW!=MW_REF))
    begin
      numTestsFailed = numTestsFailed + 1;
    end
    
    totalTests = totalTests + 1;
    
    //-------------------------------------------------------------------
    // ADD YOUR OWN TESTS BELOW
    //-------------------------------------------------------------------
    
    
    //-------------------------------------------------------------------
    // END OF TESTS
    //-------------------------------------------------------------------
    
    // print final score
    $display("MSIM> ");
    $display("MSIM> Prelab 5a Score: %2d / %2d", totalTests-numTestsFailed, totalTests);

    // Once our tests are done, we need to tell ModelSim to explicitly stop once we are
    // done with all of our test cases.
    $stop;
  end

endmodule
