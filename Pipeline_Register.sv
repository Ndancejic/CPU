module IF_ID(clk, reset, PC, instr, PC_Out, instr_Out);
	input logic clk, reset;
	input logic [63:0] PC;
	input logic [31:0] instr;
	output logic [63:0] PC_Out;
	output logic [31:0] instr_Out;
	
	always_ff @(posedge clk) begin
		if(~reset) begin
			PC_Out <= PC;
			instr_Out <= instr;
		end
	end
endmodule

module ID_EX (clk, reset, EX, MEM, WB, PC, ReadData1, ReadData2, ALUimm64, brAddr64, cbAddr64, dtAddr64, opCode, Ra, Rb, Rw,
				PC_Out, ReadData1_Out, ReadData2_Out, ALUimm64_Out, brAddr64_Out, cbAddr64_Out, dtAddr64_Out, 
				EX_Out, MEM_Out, WB_Out, opCode_Out, Ra_Out, Rb_Out, Rw_Out);
  input logic clk, reset;
  input logic [63:0] PC;
  input logic [63:0] ReadData1, ReadData2, ALUimm64, brAddr64, cbAddr64, dtAddr64;
  input logic [7:0] EX; // RegToLoc, ALUOp, ALUSrc, shiftDir, UncondBr
  input logic [2:0] MEM; // Branch, MemRead, MemWrite
  input logic [1:0] WB; //RegWrite, MemToReg
  input logic [10:0] opCode;
  input logic [4:0] Ra, Rb, Rw;
  output logic [63:0] PC_Out;
  output logic [63:0] ReadData1_Out, ReadData2_Out, ALUimm64_Out, brAddr64_Out, cbAddr64_Out, dtAddr64_Out;
  output logic [7:0] EX_Out; 
  output logic [2:0] MEM_Out; 
  output logic [1:0] WB_Out; 
  output logic [10:0] opCode_Out;
  output logic [4:0] Ra_Out, Rb_Out, Rw_Out;
  
  always_ff @(posedge clk) begin
	if(~reset) begin
		EX_Out <= EX;
		MEM_Out <= MEM;
		WB_Out <= WB;
		PC_Out <= PC;
		ReadData1_Out <= ReadData1;
		ReadData2_Out <= ReadData2;
		ALUimm64_Out <= ALUimm64;
		brAddr64_Out <= brAddr64;
		cbAddr64_Out <= cbAddr64;
		dtAddr64_Out <= dtAddr64;
		opCode_Out <= opCode;
		Rw_Out <= Rw;
		Ra_Out <= Ra;
		Rb_Out <= Rb;
	end
  end
endmodule

module EX_MEM (clk, reset, MEM, WB, brAddr, ReadData2, Rw, ALU_Result, zero, negative, overflow, carry,
				brAddr_Out, ReadData2_Out, MEM_Out, WB_Out, Rw_Out, ALU_Result_Out, zero_Out, negative_Out, overflow_Out, carry_Out);
  input logic clk, reset;
  input logic [63:0] brAddr;
  input logic [63:0] ReadData2, ALU_Result;
  input logic zero, negative, overflow, carry;
  input logic [2:0] MEM; // Branch, MemRead, MemWrite
  input logic [1:0] WB; //RegWrite, MemToReg
  input logic [4:0] Rw;
  output logic [63:0] brAddr_Out;
  output logic [63:0] ReadData2_Out, ALU_Result_Out;
  output logic zero_Out, negative_Out, overflow_Out, carry_Out;
  output logic [2:0] MEM_Out; 
  output logic [1:0] WB_Out; 
  output logic [4:0] Rw_Out;
  
  always_ff @(posedge clk) begin
	if(~reset) begin
		MEM_Out <= MEM;
		WB_Out <= WB;
		brAddr_Out <= brAddr;
		ReadData2_Out <= ReadData2;
		ALU_Result_Out <= ALU_Result;
		zero_Out <= zero;
		negative_Out <= negative;
		overflow_Out <= overflow;
		carry_Out <= carry;
		Rw_Out <= Rw;
	end
  end
endmodule

module MEM_WB (clk, reset, WB, writeData, Rw, writeData_Out, WB_Out, Rw_Out);
  input logic clk, reset;
  input logic [63:0] writeData;
  input logic [1:0] WB; //RegWrite, MemToReg
  input logic [4:0] Rw;
  output logic [63:0] writeData_Out;
  output logic [1:0] WB_Out; 
  output logic [4:0] Rw_Out;
  
  always_ff @(posedge clk) begin
	if(~reset) begin
		WB_Out <= WB;
		writeData_Out <= writeData;
		Rw_Out <= Rw;
	end
  end
endmodule