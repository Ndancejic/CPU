`timescale 1ns/10ps

module ARMCPU(clk, reset);

	input logic clk;
	input logic reset;

	//control logic
	logic Reg2Loc, MemToReg, BrTaken, UncondBr, shiftDir, RegWriteEn, MemWrite, MemReadEn;
	logic [1:0] ALUOp;
	logic [2:0] ALUSrc;

	//Instruction memory logic
	logic [31:0] instr, instr_out; //instruction
	logic [63:0] PC; // Program counter
	logic [63:0] brAddr, nextAddr, brAddr64, cbAddr64;

	//register logic
	logic [63:0] ReadData1, ReadData2, ReadData1_Out, ReadData2_Out; //Register data
	logic [4:0] Ra, Rb, Rw, reg2; // read and write registers
	logic [63:0] writeRegData;

	//ALU Logic
	logic [10:0] opCode; //11 bits op code
	logic [63:0] inputB;
	logic [63:0] ALUresult, ALUresult_Out; //results of ALU opperation
	logic [2:0] cntrl;
	logic negative, zero, overflow, carry_out; //flags from ALU
	logic negativehold, zerohold, overflowhold, carry_outhold; //flags from ALU to be held over clock
	logic [11:0] ALUimm;
	logic [63:0] ALUimm64;

	//dataMemory Logic
	logic [3:0] xfer_size;
	logic [63:0] MemRead, MemRead_Out;

	//sign extend logic
	logic [63:0] dtAddr64;

	//shifter logic
	logic [63:0] shiftedBrAddr, shiftedcb, shiftedVal;
	logic [5:0] shamt;

	//mult
	logic [63:0] multRes, mult_high;
	logic [63:0] brRes;

	//control
	control c1 (.opCode, .zero, .negative(negativehold), .overflow(overflowhold), .Reg2Loc,
				.MemToReg, .ALUSrc, .BrTaken, .RegWriteEn, .MemWrite, .UncondBr, .ALUOp, .shiftDir, .MemReadEn);

	//Instruction memory
	instructmem instructions (.address(PC), .instruction(instr), .clk);

	//registers
	regfile registers (.ReadData1, .ReadData2, .WriteData(MemRead_Out), .ReadRegister1(Ra),
						.ReadRegister2(reg2), .WriteRegister(Rw), .RegWrite(RegWriteEn), .clk, .reset);

	//ALU
	ALUControl aluctrl (.ALUOp(ALUOp), .OpcodeField(opCode), .operation(cntrl));
	ARMALU ALUblock (.A(ReadData1_Out), .B(ReadData2_Out), .cntrl(cntrl), .result(ALUresult),
						.negative, .zero, .overflow, .carry_out);

	//Data memory
	datamem data (.address(ALUresult_Out), .write_enable(MemWrite), .read_enable(MemReadEn), .write_data(ReadData2_Out), .clk, .xfer_size, .read_data(MemRead));

	//muxes
	muxRegToLoc mtr(.in1(Rb), .in2(Rw), .sel(Reg2Loc), .out(reg2));
	mux2 r2l(.in1(MemRead), .in2(ALUresult_Out), .sel(MemToReg), .out(writeRegData));
	mux2 mbr(.in1(shiftedBrAddr), .in2(shiftedcb), .sel(UncondBr), .out(brRes));
	mux8 m8(.ReadData2(ReadData2), .ALUimm64, .shiftedVal, .multRes, .dtAddr64, .ALUSrc, .inputB);

	//sign extend
	signExtend dtadd(instr_out, dtAddr64, 2'b00);
	signExtend immsign(instr_out, ALUimm64, 2'b01);
	signExtend brsign(instr_out, brAddr64, 2'b10);
	signExtend cbsign(instr_out, cbAddr64, 2'b11);

	//address shift
	shifter shiftLeft2(.value(brAddr64), .direction(1'b0), .distance(6'b000010), .result(shiftedBrAddr));
	shifter shiftLeft2cb(.value(cbAddr64), .direction(1'b0), .distance(6'b000010), .result(shiftedcb));
	shifter shiftVal(.value(ReadData1_Out), .direction(shiftDir), .distance(shamt), .result(shiftedVal));

	//mult
	mult m1(.A(ReadData1_Out), .B(ReadData2_Out), .doSigned(1'b1), .mult_low(multRes), .mult_high());

	//PC logic
	ARMALU bradd (.A(PC), .B(brRes), .cntrl(3'b010), .result(brAddr), .negative(), .zero(), .overflow(), .carry_out());
	ARMALU fouradd (.A(PC), .B(64'h0000000000000004), .cntrl(3'b010), .result(nextAddr), .negative(), .zero(), .overflow(), .carry_out());

	//Pipeline Stages
	//Instruction Fetch
	Pipeline_Register InstrFetch (.In(instr), .Out(instr_out), .clk, .reset);

	//Register Fetch
	Pipeline_Register RegFetch (.In(ReadData1), .Out(ReadData1_Out), .clk, .reset);
	Pipeline_Register RegFetch (.In(inputB), .Out(ReadData2_Out), .clk, .reset);

	//Execute
	Pipeline_Register Execute (.In(ALUresult), .Out(ALUresult_Out), .clk, .reset);

	//Data memory
	Pipeline_Register MEM (.In(writeRegData), .Out(MemRead_Out), .clk, .reset);


// splitting instruction
	always_comb begin
		Rw <= instr_out[4:0];
		Ra <= instr_out[9:5];
		shamt <= instr_out[15:10];
		Rb <= instr_out[20:16];
		opCode <= instr_out[31:21];
		xfer_size <= 4'b1000; //just always set to 8
	end

	always_ff @(posedge clk) begin
		if(reset)
			PC <= 64'h0000000000000000;
		else begin
			if(BrTaken) PC <= brAddr;
			else PC <= nextAddr;
		end
		if(cntrl==3'b011) begin
			negativehold <= negative;
			zerohold <= zero;
			overflowhold <= overflow;
			carry_outhold <= carry_out;
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
