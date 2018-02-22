module ALUControl(ALUOp, OpcodeField, operation);
	input logic [1:0] ALUOp;
	input logic [10:0] OpcodeField;
	output logic [2:0] operation;

	always_comb begin
		if(ALUOp == 2'b00) operation <= 3'b010;
		else if(ALUOp[0]) operation <= 3'b000;
		else
			casex(OpcodeField)
				11'b10101011000: operation <= 3'b010; //add
				11'b11111000010: operation <= 3'b010; //add
				11'b11111000000: operation <= 3'b010; //add
				11'b11101011000: operation <= 3'b011; //sub
				11'b1001000100x: operation <= 3'b010; //add
				default: operation <= 3'b000;
			endcase
	end
endmodule

module ALUControl_testbench();
	parameter delay = 100000;

	 logic [1:0] ALUOp;
	 logic [10:0] OpcodeField;
	 logic [2:0] operation;

	ALUControl aluct(.ALUOp, .OpcodeField, .operation);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);
	initial begin

		$display("%t ALUControlTesting", $time);
		ALUOp = 2'b00; #(delay);
		assert(operation == 3'b010);
		ALUOp = 2'b01; #(delay);
		assert(operation == 3'b000);
		ALUOp = 2'b10; OpcodeField = 11'b11101011000; #(delay);
		assert(operation == 3'b011);

	end
endmodule
