// Test bench for ALU
`timescale 1ns/10ps

// Meaning of signals in and out of the ALU:

// Flags:
// negative: whether the result output is negative if interpreted as 2's comp.
// zero: whether the result output was a 64-bit zero.
// overflow: on an add or subtract, whether the computation overflowed if the inputs are interpreted as 2's comp.
// carry_out: on an add or subtract, whether the computation produced a carry-out.

// cntrl			Operation						Notes:
// 000:			result = B						value of overflow and carry_out unimportant
// 010:			result = A + B
// 011:			result = A - B
// 100:			result = bitwise A & B		value of overflow and carry_out unimportant
// 101:			result = bitwise A | B		value of overflow and carry_out unimportant
// 110:			result = bitwise A XOR B	value of overflow and carry_out unimportant

module alustim();

	parameter delay = 100000;

	logic		[63:0]	A, B;
	logic		[2:0]		cntrl;
	logic		[63:0]	result;
	logic					negative, zero, overflow, carry_out ;

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;


	ARMALU dut (.A, .B, .cntrl, .result, .negative, .zero, .overflow, .carry_out);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	integer i;
	logic [63:0] test_val;
	initial begin

		$display("%t testing PASS_A operations", $time);
		cntrl = ALU_PASS_B;
		for (i=0; i<100; i++) begin
			A = $random(); B = $random();
			#(delay);
			assert(result == B && negative == B[63] && zero == (B == '0));
		end

		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'h0000000000000001; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h0000000000000002 && carry_out == 0 && overflow == 0 && negative == 0 && zero == 0);

		$display("%t testing addition", $time);
		cntrl = ALU_ADD;
		A = 64'h7FFFFFFFFFFFFFFF; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h8000000000000000 && carry_out == 0 && overflow == 1 && negative == 1 && zero == 0);

		$display("%t testing addition", $time);
		cntrl = ALU_SUBTRACT;
		A = 64'h0000000000000004; B = 64'h0000000000000001;
		#(delay);
		assert(result == 64'h0000000000000003 && carry_out == 0 && overflow == 0 && negative == 0 && zero == 0);

		$display("%t testing addition", $time);
		cntrl = ALU_SUBTRACT;
		A = 64'h0000000000000004; B = 64'h0000000000000004;
		#(delay);
		assert(result == 64'h0000000000000000 && carry_out == 0 && overflow == 0 && negative == 0 && zero == 1);

	end
endmodule

module subtractor_testbench();
	parameter delay = 100000;

	logic a,b,carryIn;
	logic carryOut,sum;

	subtractor s1(.a, .b, .carryIn, .carryOut, .sum);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);
	initial begin

		$display("%t testing subtraction", $time);
		a = 0; b = 0; carryIn = 0; #(delay);
		assert(sum == 0 && carryOut == 0);
		a = 0; b = 0; carryIn = 1; #(delay);
		assert(sum == 1 && carryOut == 1);
		a = 0; b = 1; carryIn = 0; #(delay);
		assert(sum == 1 && carryOut == 1);
		a = 0; b = 1; carryIn = 1; #(delay);
		assert(sum == 0 && carryOut == 1);
		a = 1; b = 0; carryIn = 0; #(delay);
		assert(sum == 1 && carryOut == 0);
		a = 1; b = 0; carryIn = 1; #(delay);
		assert(sum ==0 && carryOut == 0);
		a = 1; b = 1; carryIn = 0; #(delay);
		assert(sum == 0 && carryOut == 0);
		a = 1; b = 1; carryIn = 1; #(delay);
		assert(sum == 1 && carryOut == 1);

	end
endmodule

module onebitALU_testbench();
	parameter delay = 100000;

	logic a,b,carryIn;
	logic [2:0] op;
	logic Result, carryOut;

	onebitALU al1(.a, .b, .carryIn, .op, .Result, .carryOut);

	parameter ALU_PASS_B=3'b000, ALU_ADD=3'b010, ALU_SUBTRACT=3'b011, ALU_AND=3'b100, ALU_OR=3'b101, ALU_XOR=3'b110;

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);
	initial begin

		$display("%t testing pass b", $time);
		op = ALU_PASS_B;
		b=0; #(delay);
		assert(Result == 0);
		b=1; #(delay);
		assert(Result == 1);

		$display("%t testing addition", $time);
		op = ALU_ADD;
		a = 1; b = 1; carryIn=0; #(delay);
		assert(Result == 0 && carryOut == 1);
		a = 0; b = 1; carryIn=0; #(delay);
		assert(Result == 1 && carryOut == 0);
		a = 1; b = 1; carryIn=1; #(delay);
		assert(Result == 1 && carryOut == 1);
		a = 0; b = 1; carryIn=1; #(delay);
		assert(Result == 0 && carryOut == 1);

		$display("%t testing subtraction", $time);
		op = ALU_SUBTRACT;
		a = 0; b = 0; carryIn = 0; #(delay);
		assert(Result == 0 && carryOut == 0);
		a = 0; b = 0; carryIn = 1; #(delay);
		assert(Result == 1 && carryOut == 1);
		a = 0; b = 1; carryIn = 0; #(delay);
		assert(Result == 1 && carryOut == 1);
		a = 0; b = 1; carryIn = 1; #(delay);
		assert(Result == 0 && carryOut == 1);
		a = 1; b = 0; carryIn = 0; #(delay);
		assert(Result == 1 && carryOut == 0);
		a = 1; b = 0; carryIn = 1; #(delay);
		assert(Result ==0 && carryOut == 0);
		a = 1; b = 1; carryIn = 0; #(delay);
		assert(Result == 0 && carryOut == 0);
		a = 1; b = 1; carryIn = 1; #(delay);
		assert(Result == 1 && carryOut == 1);

		$display("%t testing pass AND", $time);
		op = ALU_AND;
		a=1; b=0; #(delay);
		assert(Result == 0);
		a=1; b=1; #(delay);
		assert(Result == 1);

		$display("%t testing pass OR", $time);
		op = ALU_OR;
		a=1; b=0; #(delay);
		assert(Result == 1);
		a=1; b=1; #(delay);
		assert(Result == 1);

		$display("%t testing pass XOR", $time);
		op = ALU_XOR;
		a=0; b=0; #(delay);
		assert(Result == 0);
		a=0; b=1; #(delay);
		assert(Result == 1);
		a=1; b=0; #(delay);
		assert(Result == 1);
		a=1; b=1; #(delay);
		assert(Result == 0);

	end
endmodule


module adder_testbench();
	parameter delay = 100000;

	logic a,b,carryIn;
	logic carryOut,sum;

	adder a1(.a, .b, .carryIn, .carryOut, .sum);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);
	initial begin

		$display("%t testing addition", $time);
		a = 1; b = 1; carryIn=0; #(delay);
		assert(sum == 0 && carryOut == 1);
		a = 0; b = 1; carryIn=0; #(delay);
		assert(sum == 1 && carryOut == 0);
		a = 1; b = 1; carryIn=1; #(delay);
		assert(sum == 1 && carryOut == 1);
		a = 0; b = 1; carryIn=1; #(delay);
		assert(sum == 0 && carryOut == 1);

	end
endmodule
