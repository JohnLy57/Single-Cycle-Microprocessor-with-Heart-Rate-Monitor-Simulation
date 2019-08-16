module sign_xshift(OFF_IN,OFF_SHIFT);

input  [5:0]OFF_IN;
output [7:0]OFF_SHIFT;
wire [7:0]OFF_X;

assign OFF_X [7:0] = {OFF_IN[5], OFF_IN[5], OFF_IN[5:0]};

assign OFF_SHIFT[7:0]={OFF_X[6:0],1'b0};


endmodule