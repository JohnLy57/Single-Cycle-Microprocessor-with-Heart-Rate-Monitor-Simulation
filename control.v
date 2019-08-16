module control(OP, CISEL, BSEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP); // add other inputs and outputs here

// inputs (add others here)
	input [2:0] OP;


	output reg CISEL, BSEL,  SHIFT_LA, SHIFT_LR, LOGICAL_OP;
	output reg [1:0] OSEL;
// outputs (add others here)


// reg and internal variable definitions


// implement module here (add other control signals below)
	parameter [2:0] 
	ADD= 3'b000,
	SUB=3'b001,
	SRA=3'b010,
	SRL=3'b011,
	SLL=3'b100,
	AND=3'b101,
	OR=3'b110;
							
	
	always @(*)begin
	
		if (OP==ADD)begin
			BSEL=1'b0;CISEL=1'b0;OSEL=2'b00; SHIFT_LA=1'bx;SHIFT_LR=1'bx;LOGICAL_OP=1'bx;
		end
		else if (OP==SUB)begin
			BSEL=1'b1;CISEL=1'b1;OSEL=2'b00;SHIFT_LA=1'bx;SHIFT_LR=1'bx;LOGICAL_OP=1'bx;
		end
		else if (OP==SRA)begin
			BSEL=1'bx;CISEL=1'bx;OSEL=2'b01;SHIFT_LA=1'b1;SHIFT_LR=0;LOGICAL_OP=1'bx;
		end
		else if (OP==SRL)begin
			BSEL=1'bx;CISEL=1'bx;OSEL=2'b01;SHIFT_LA=0;SHIFT_LR=1;LOGICAL_OP=1'bx;
		end
		else if (OP==SLL)begin
			BSEL=1'bx;CISEL=1'bx;OSEL=2'b01;SHIFT_LA=0;SHIFT_LR=0;LOGICAL_OP=1'bx;
		end
		else if (OP==AND)begin
			BSEL=1'b0;CISEL=1'bx;OSEL=2'b10;SHIFT_LA=1'bx;SHIFT_LR=1'bx;LOGICAL_OP=1'b1;
		end
		else if (OP==OR)begin
			BSEL=1'b0;CISEL=1'bx;OSEL=2'b10;SHIFT_LA=1'bx;SHIFT_LR=1'bx;LOGICAL_OP=1'b0;
		end
		else begin
			BSEL=1'bx;CISEL=1'bx;OSEL=1'bx;SHIFT_LA=1'bx;SHIFT_LR=1'bx;LOGICAL_OP=1'bx;
		end
	end
endmodule
