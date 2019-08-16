module muxY(ADDOUT, SHIFTOUT, LOGICOUT, OSEL, Y);
	input [1:0]OSEL;
	input [7:0]ADDOUT;
	input [7:0]SHIFTOUT;
	input [7:0]LOGICOUT;
	
	output [7:0] Y;
	
	assign Y=(OSEL==2'b00) ? ADDOUT : (OSEL==2'b01)? SHIFTOUT : (OSEL==2'b10) ? LOGICOUT: 8'b00000000;

endmodule