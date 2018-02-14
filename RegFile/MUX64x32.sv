// create 64x31:1 multiplexer
module MUX64x32 (ReadData, RegData, ReadSelect);

	input logic [63:0] RegData[31:0];
	input logic [4:0] ReadSelect;
	output logic [63:0] ReadData;
	
	//outputs the data of the selected Register
	always_comb
		ReadData = RegData[ReadSelect];
endmodule 