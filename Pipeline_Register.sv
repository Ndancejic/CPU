module IF_ID(clk, reset, PC, instr, PC_Out, instr_Out);
	input logic clk, reset;
	input logic [63:0] PC;
	input logic [31:0] instr;
	output logic [63:0] PC_Out;
	output logic [31:0] instr_Out;
	
	always @(posedge clk) begin
		if(~reset) begin
			PC_Out <= PC;
			instr_Out <= instr;
		end
	end
endmodule

module ID_EX (clk, reset, EX, MEM, WB, PC, ReadData1, ReadData2, ALUimm64, shiftedVal, multRes, dtAddr64, opCode, Rw
				PC_Out, ReadData1_Out, ReadData2_Out, ALUimm64_Out, shiftedVal_Out, multRes_Out, dtAddr64_Out, 
				EX_Out, MEM_Out, WB_Out, opCode_Out, Rw_Out);
  input logic clk, reset;
  input logic [63:0] PC;
  input logic [63:0] ReadData1, ReadData2, ALUimm64, shiftedVal, multRes, dtAddr64;
  input logic [5:0] EX; // ALUOp, ALUSrc, shiftDir
  input logic [3:0] MEM; // Branch, UnCondBR, MemRead, MemWrite
  input logic [1:0] WB; //RegWrite, MemToReg
  input logic [10:0] opCode;
  input logic [4:0] Rw;
  output logic [63:0] PC_Out;
  output logic [63:0] ReadData1_Out, ReadData2_Out, ALUimm64_Out, shiftedVal_Out, multRes_Out, dtAddr64_Out;
  output logic [5:0] EX_Out; 
  output logic [3:0] MEM_Out; 
  output logic [1:0] WB_Out; 
  output logic [10:0] opCode_Out;
  output logic [4:0] Rw_Out;
  
  always @(posedge clk) begin
	if(~reset) begin
		EX_Out <= EX;
		MEM_Out <= MEM;
		WB_Out <= WB;
		PC_Out <= PC;
		ReadData1_Out <= ReadData1;
		ReadData2_Out <= ReadData2;
		ALUimm64_Out <= ALUimm64;
		shiftedVal_Out <= shiftedVal;
		multRes_Out <= multRes;
		dtAddr64_Out <= dtAddr64;
		opCode_Out <= opCode;
		Rw_Out <= Rw;
	end
  end
endmodule

module EX_MEM (clk, reset, MEM, WB, brAddr, ReadData2, Rw, ALU_Result, zero, 
				brAddr_Out, ReadData2_Out, MEM_Out, WB_Out, Rw_Out, ALU_Result_Out, zero_Out);
  input logic clk, reset;
  input logic [63:0] brAddr;
  input logic [63:0] ReadData2, ALU_Result;
  input logic zero;
  input logic [3:0] MEM; // Branch, UnCondBR, MemRead, MemWrite
  input logic [1:0] WB; //RegWrite, MemToReg
  input logic [4:0] Rw;
  output logic [63:0] brAddr_Out;
  output logic [63:0] ReadData2_Out, ALU_Result_Out;
  output logic zero_Out;
  output logic [3:0] MEM_Out; 
  output logic [1:0] WB_Out; 
  output logic [4:0] Rw_Out;
  
  always @(posedge clk) begin
	if(~reset) begin
		MEM_Out <= MEM;
		WB_Out <= WB;
		brAddr_Out <= brAddr;
		ReadData2_Out <= ReadData2;
		ALU_Result_Out <= ALU_Result;
		zero_Out <= zero;
		Rw_Out <= Rw;
	end
  end
endmodule

module MEM_WB (clk, reset, WB, memReadData, Rw, ALU_Result, 
				PC_Out, memReadData_Out, WB_Out, Rw_Out, ALU_Result_Out);
  input logic clk, reset;
  input logic [63:0] memReadData, ALU_Result;
  input logic [1:0] WB; //RegWrite, MemToReg
  input logic [4:0] Rw;
  output logic [63:0] memReadData_Out, ALU_Result_Out;
  output logic [1:0] WB_Out; 
  output logic [4:0] Rw_Out;
  
  always @(posedge clk) begin
	if(~reset) begin
		WB_Out <= WB;
		memReadData_Out <= memReadData;
		ALU_Result_Out <= ALU_Result;
		Rw_Out <= Rw;
	end
  end
endmodule