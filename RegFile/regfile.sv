module regfile (ReadData1, ReadData2, WriteData, ReadRegister1, ReadRegister2, WriteRegister, RegWrite, clk, reset);

	input logic clk, RegWrite, reset;
	input logic [4:0] WriteRegister, ReadRegister1, ReadRegister2;
	input logic [63:0] WriteData;
	output logic [63:0]  ReadData1, ReadData2;

	logic [31:0] RegSelect;
	logic [63:0] DataOut[31:0];

	DECODER dec (.RegSelect(RegSelect), .Select(WriteRegister), .RegEnable(RegWrite));
	REG_ARRAY regarr (.DataOut(DataOut), .DataIn(WriteData), .RegEnable(RegSelect), .clk(clk), .reset(reset));
	MUX64x32 reg1 (.ReadData(ReadData1), .RegData(DataOut), .ReadSelect(ReadRegister1));
	MUX64x32 reg2 (.ReadData(ReadData2), .RegData(DataOut), .ReadSelect(ReadRegister2));

endmodule
