// creates 31 registers
module REG_ARRAY (DataOut, DataIn, RegEnable, clk, reset);

	input logic [63:0] DataIn;
	input logic [31:0] RegEnable;
	input logic clk, reset;
	output logic [63:0] DataOut[31:0];

	//generates 32 Registers and connects them to the output of the decoder
	genvar i;
	generate
		for(i = 0; i < 31; i++) begin : eachReg
			REG_FF register (.DataOut(DataOut[i]), .DataIn(DataIn), .WriteEn(RegEnable[i]), .clk(clk), .reset(reset));
		end
	endgenerate

	REG_FF reg31 (.DataOut(DataOut[31]), .DataIn(64'd0), .WriteEn(RegEnable[31]), .clk(clk), .reset(reset));

endmodule

// create 64 d flip flops for each register
module REG_FF (DataOut, DataIn, WriteEn, clk, reset);

	input logic [63:0] DataIn;
	input logic WriteEn, clk, reset;
	output logic [63:0] DataOut;
	logic [63:0] RegIn, tempRegIn1, tempRegIn2, notWriteEn;
	
	//generates logic for the input to the register
	genvar j;
	generate
		for (j = 0; j < 64; j++) begin : logicgates
			and and1 (tempRegIn1[j], WriteEn, DataIn[j]);
			not notWrite (notWriteEn[j], WriteEn);
			and and2 (tempRegIn2[j], notWriteEn[j], DataOut[j]);
			or or1 (RegIn[j], tempRegIn1[j], tempRegIn2[j]);
		end
	endgenerate 

	//generates 64 D_FF for a 64 bit register
	genvar i;
	generate
		for(i = 0; i < 64; i++) begin : eachDFF
			D_FF ff (.q(DataOut[i]), .d(RegIn[i]), .clk(clk), .reset(reset));
		end
	endgenerate

endmodule

module D_FF (q, d, reset, clk);

	output reg q;
	input logic d, clk, reset;

	always_ff @(posedge clk)
		if(reset)
			q <= 0; //on reset set to 0
		else
			q <= d; //otherwise out = d

endmodule
