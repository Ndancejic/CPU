module mux2(in1, in2, sel, out);
	input logic [63:0] in1, in2;
	input logic sel;
	output logic [63:0] out;
	always_comb begin
		if(sel) out <= in1;
		else out <= in2;
	end
endmodule

module muxRegToLoc(in1, in2, sel, out);
	input logic [4:0] in1, in2;
	input logic sel;
	output logic [4:0] out;
	always_comb begin
		if(sel) out <= in1;
		else out <= in2;
	end
endmodule

module mux8(ReadData2, ALUimm64, shiftedVal, multRes, dtAddr64, ALUSrc, inputB);
	input logic [63:0] ReadData2, ALUimm64, shiftedVal, multRes, dtAddr64;
	output logic [63:0] inputB;
	input logic [2:0] ALUSrc;
	
	always_comb begin
		case(ALUSrc)
			3'b000: inputB <= ReadData2;
			3'b001: inputB <= ALUimm64;
			3'b010: inputB <= shiftedVal;
			3'b011: inputB <= multRes;
			3'b100: inputB <= dtAddr64;
		endcase
	end
endmodule

module muxMemToReg();
endmodule