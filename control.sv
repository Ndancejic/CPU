module control(opCode, Reg2Loc, MemToReg, ALUSrc, BrTaken, RegWriteEn, MemWrite, UncondBr, ALUOp, shiftDir, MemReadEn, bLT, CBZ);
	input logic [10:0] opCode;
	output logic Reg2Loc, MemToReg, BrTaken, RegWriteEn, MemWrite, UncondBr, shiftDir, MemReadEn;
	output logic [1:0] ALUOp;
	output logic [2:0] ALUSrc;
	output logic CBZ, bLT;

	always_comb begin
		casex(opCode)
			11'b01010100xxx:
				begin
					CBZ <= 0;
					bLT <= 1;
				end
			11'b10110100xxx:
				begin
					CBZ <= 1;
					bLT <= 0;
				end
		endcase
		casex(opCode)
							//R type
			11'b1xxx1011000:
								begin
									Reg2Loc <= 1;
									MemToReg <= 0;
									if(opCode[7]) ALUSrc <= 3'b011; else ALUSrc <= 3'b000;
									BrTaken <= 0;
									RegWriteEn <= 1;
									MemWrite <= 0;
									MemReadEn <= 0;
									ALUOp <= 2'b10;
								end
							//ADDI
			11'b1001000100x:
							begin
									Reg2Loc<=1;
									MemToReg<=0;
									ALUSrc<= 3'b001;
									BrTaken<=0;
									RegWriteEn<=1;
									MemWrite<=0;
									MemReadEn <= 0;
									ALUOp<=2'b10;
							end
							//shift
			11'b1101001101x:
							begin
									Reg2Loc<=1;
									MemToReg<=0;
									ALUSrc<=3'b010;
									BrTaken<=0;
									shiftDir<=~opCode[0];
									RegWriteEn<=1;
									MemWrite<=0;
									MemReadEn <= 0;
									ALUOp<=2'b10;
							end
							//LDUR/STUR
			11'b111110000x0:
							begin
									Reg2Loc<=0;
									MemToReg<=opCode[1];
									ALUSrc<=3'b100;
									BrTaken<=0;
									RegWriteEn<=opCode[1];
									MemWrite<=~opCode[1];
									MemReadEn <= opCode[1];
									ALUOp<=2'b00;
							end
							//CB type
			11'bxxx101xxxxx:
							begin
									Reg2Loc <= opCode[9];
									BrTaken<= 1; //| opCode[10]&zero | opCode[9]&negative&~overflow;
									UncondBr<= (opCode[10:9]==2'b00);
									RegWriteEn<=0;
									MemWrite<=0;
									MemReadEn <=0;
									MemToReg<=0;
									ALUOp<=opCode[9:8];
									ALUSrc<= {(opCode[10:9]==2'b00),2'b00};
							end
		endcase
	end
endmodule

/*module control_testbench();
	parameter delay = 100000;

	  logic [10:0] opCode;
	 logic zero;
	 logic Reg2Loc, MemToReg, BrTaken, RegWriteEn, MemWrite, UncondBr, shiftDir;
	 logic [1:0] ALUOp, ALUSrc;

	control ct(.opCode, .zero, .Reg2Loc, .MemToReg, .ALUSrc, .BrTaken, .RegWriteEn, .MemWrite, .UncondBr, .ALUOp, .shiftDir);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);
	initial begin

		$display("%t ControlTesting", $time);
		opCode = 11'b10110100xxx; zero=1; #(delay);
		assert(Reg2Loc==0 && ALUSrc==2'b00 && BrTaken==1 &&UncondBr==0 && RegWriteEn==0&&MemWrite==0&&ALUOp==2'b01);

	end
endmodule*/
