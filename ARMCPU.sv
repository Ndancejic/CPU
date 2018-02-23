`timescale 1ns/10ps

module ARMCPU(clk, reset);

	input logic clk;
	input logic reset;

	//Instruction Fetch logic
	logic [31:0] instr, instr_IFetch; //instruction
	logic [63:0] instr64;
	logic [63:0] PC, PC_IFetch, nextAddr; // Program counter
	logic Reg2Loc;
	
	//Register Fetch Logic
	logic [63:0] PC_Reg;
	logic [63:0] ReadData1, ReadData2, ReadData1_Reg, ReadData2_Reg; //Register data
	logic [4:0] Ra, Rb, Rw, Rw_Reg, reg2; // read and write registers
	logic [10:0] opCode, opCode_Reg; //11 bits op code
	logic negative, zero, overflow, carry_out; //flags from ALU
	logic negativeIn, zeroIn, overflowIn, carry_outIn;
	logic negativeHold, zeroHold, overflowHold, carry_outHold; //flags from ALU to be held over clock
	logic [63:0] ALUimm64, brAddr64, cbAddr64, dtAddr64, ALUimm64_Reg, brAddr64_Reg, cbAddr64_Reg, dtAddr64_Reg;
	logic Reg2Loc, shiftDir, UncondBr, MemToReg_ctrl, BrTaken_ctrl, UncondBr_ctrl, shiftDir_ctrl, RegWriteEn_ctrl, MemWrite_ctrl, MemReadEn_ctrl;
	logic [1:0] ALUOp_ctrl, ALUOp;
	logic [2:0] ALUSrc_ctrl, ALUSrc;
	logic [2:0] MEM_Reg;
    logic [1:0] WB_Reg;
	
	//Execute logic
	logic [63:0] shiftedVal, multRes, mult_high;
	logic [5:0]  shamt; 
	logic [4:0] Rw_Exec;
	logic [63:0] shiftedBrAddr, shiftedcb,brAddr, brPass, brRes;
	logic [63:0] inputB, ALUresult, ALUresult_Exec, ReadData2_Exec, ALUIn1, ALUIn2;
	logic [2:0] cntrl;
	logic BrTaken, MemReadEn, MemWrite;
	logic [1:0] WB_Exec;
	logic [1:0] ForwardA, ForwardB;
	
	//Data memory Logic 
	logic [3:0] xfer_size;
	logic [4:0] Rw_Mem;
	logic [63:0] MemRead, MemRead_Mem, ALUresult_Mem;
	logic  MemToReg , RegWriteEn;
	
	//Write back logic
	logic [63:0] writeRegData;

	//Pipeline Stages
	//Instruction Fetch
	ARMALU pc_plus_4 (.A(PC), .B(64'h0000000000000004), .cntrl(3'b010), .result(nextAddr), .negative(), .zero(), .overflow(), .carry_out());
	instructmem instructions (.address(PC), .instruction(instr), .clk);
	IF_ID  IFetch (.clk, .reset, .PC, .instr, .PC_Out(PC_IFetch), .instr_Out(instr_IFetch));

	//Register Fetch
	muxRegToLoc mtr(.in1(Rb), .in2(Rw), .sel(Reg2Loc), .out(reg2));
	regfile registers (.ReadData1, .ReadData2, .WriteData(writeRegData), .ReadRegister1(Ra),
						.ReadRegister2(reg2), .WriteRegister(Rw_Mem), .RegWrite(RegWriteEn), .clk, .reset);
	signExtend dtadd(instr_IFetch, dtAddr64, 2'b00);
	signExtend immsign(instr_IFetch, ALUimm64, 2'b01);
	signExtend brsign(instr_IFetch, brAddr64, 2'b10);
	signExtend cbsign(instr_IFetch, cbAddr64, 2'b11);
	signExtend ins(.in(instr_IFetch), .out(instr64), .ext());
	control c1 (.opCode, .Reg2Loc, .MemToReg_ctrl, .ALUSrc_ctrl, .BrTaken_ctrl, .RegWriteEn_ctrl, .MemWrite_ctrl, 
				.UncondBr_ctrl, .ALUOp_ctrl, .shiftDir_ctrl, .MemReadEn_ctrl);
	ID_EX idex (.clk, .reset, .EX({ALUOp_ctrl,ALUSrc_ctrl,shiftDir_ctrl, UncondBr_ctrl}), .MEM({BrTaken_ctrl,MemReadEn_ctrl,MemWrite_ctrl}), 
				.WB({RegWriteEn_ctrl,MemToReg_ctrl}), .PC(PC_IFetch), .ReadData1, .ReadData2, .ALUimm64, .brAddr64, .cbAddr64, .dtAddr64, 
				.opCode, .Rw, .PC_Out(PC_Reg), .ReadData1_Out(ReadData1_Reg), .ReadData2_Out(ReadData2_Reg), 
				.ALUimm64_Out(ALUimm64_Reg), .brAddr64_Out(brAddr64_Reg), cbAddr64_Out(cbAddr64_Reg), dtAddr64_Out(dtAddr64_Reg), 
				.EX_Out({ALUOp,ALUSrc,shiftDir,UncondBr}), .MEM_Out(MEM_Reg), .WB_Out(WB_Reg), .opCode_Out(opCode_Reg), .Rw_Out(Rw_Reg));

	//Execute
	shifter shiftLeft2(.value(brAddr64_Reg), .direction(1'b0), .distance(6'b000010), .result(shiftedBrAddr));
	shifter shiftLeft2cb(.value(cbAddr64_Reg), .direction(1'b0), .distance(6'b000010), .result(shiftedcb));
	mux2 mbr(.in1(shiftedBrAddr), .in2(shiftedcb), .sel(UncondBr), .out(brRes));
	ARMALU bradd (.A(PC_Reg), .B(brRes), .cntrl(3'b010), .result(brPass), .negative(), .zero(), .overflow(), .carry_out());
	mult m1(.A(ALUIn1), .B(ALUIn2), .doSigned(1'b1), .mult_low(multRes), .mult_high());
	shifter shiftVal(.value(ALUIn1), .direction(shiftDir), .distance(shamt), .result(shiftedVal));
	mux8 m8(.ALUIn2, .ALUimm64_Reg, .shiftedVal, .multRes, .dtAddr64_Reg, .ALUSrc, .inputB);
	ALUControl aluctrl (.ALUOp(ALUOp), .OpcodeField(opCode_Reg), .operation(cntrl));
	ARMALU ALUblock (.A(ALUIn1), .B(inputB), .cntrl(cntrl), .result(ALUresult),
						.negative(negativeIn), .zero(zeroIn), .overflow(overflowIn), .carry_out(carry_outIn));
	mux3 fwda(.in1(ReadData1_Reg), .in2(writeRegData), .in3(ALUresult_Exec), .sel(ForwardA), .out(ALUIn1));
	mux3 fwdb(.in1(ReadData2_Reg), .in2(writeRegData), .in3(ALUresult_Exec), .sel(ForwardB), .out(ALUIn2));
	Forwarding frwd(.clk, .reset, .EX_MEM_RegWrite(WB_Exec[1]), .MEM_WB_RegWrite(RegWriteEn), .EX_MEM_Rw(Rw_Exec),
					.MEM_WB_Rw(Rw_Mem), .ID_EX_Ra(Ra), .ID_EX_Rb(Rb), .ForwardA, .ForwardB);
	EX_MEM exmem(.clk, .reset, .MEM(MEM_Reg), .WB(WB_Reg), .brAddr(brPass), .ReadData2(ReadData2_Reg), .Rw(Rw_Reg), .ALU_Result(ALUresult), 
				.zero(zeroHold), .brAddr_Out(brAddr), .ReadData2_Out(ReadData2_Exec), .MEM_Out({BrTaken, MemReadEn, MemWrite}), 
				.WB_Out(WB_Exec), .Rw_Out(Rw_Exec), .ALU_Result_Out(ALUresult_Exec), .zero_Out(zeroHold), .negative_Out(negativeHold),
				.overflow_Out(overflowHold), .carry_Out(carry_outHold));

	//Data memory
	datamem data (.address(ALUresult_Exec), .write_enable(MemWrite), .read_enable(MemReadEn), .write_data(ReadData2_Exec),
					.clk, .xfer_size, .read_data(MemRead));
	MEM_WB memwb(.clk, .reset, .WB{WB_Exec}, .memReadData(MemRead), .Rw(Rw_Exec), .ALU_Result(ALUresult_Exec), 
				.memReadData_Out(MemRead_Mem), .WB_Out({RegWriteEn, MemToReg}), .Rw_Out(Rw_Mem), .ALU_Result_Out(ALUresult_Mem));
				
	//Write Back
	mux2 r2l(.in1(MemRead_Mem), .in2(ALUresult_Mem), .sel(MemToReg), .out(writeRegData));
	

// splitting instruction
	always_comb begin
		Rw <= instr[4:0];
		Ra <= instr[9:5];
		shamt <= instr[15:10];
		Rb <= instr[20:16];
		opCode <= instr[31:21];
		xfer_size <= 4'b1000; //just always set to 8
	end

	always_ff @(posedge clk) begin
		if(reset)
			PC <= 64'h0000000000000000;
		else begin
			if(BrTaken&(UncondBr | zeroHold | negativeHold&~overflowHold)) PC <= brAddr;
			else PC <= nextAddr;
		end
		//set flags only for ADDS and SUBS
		if(opCode==11'b10101011000 | opCode==11'b11101011000) begin
			negative <= negativeHold;
			zero <= zeroHold;
			overflow <= overflowHold;
			carry_out <= carry_outHold;
		end
	end

endmodule

module ARMCPU_testbench ();

	parameter ClockDelay = 5000000;

	logic					clk, reset;

	ARMCPU armcp (.clk, .reset);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	integer i;
	initial begin
		reset <= 1;
		@(posedge clk);
		reset <= 0;
		for (i=0; i <= 1000; i = i + 1) begin
			@(posedge clk);
		end
		$stop;

	end
endmodule
