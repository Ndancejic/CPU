//adds bits a and b
module adder(a,b,carryIn,carryOut,sum);
	input logic a,b,carryIn;
	output logic carryOut,sum;

	//assigns the sum of a and b to sum
	//assigns the carry to carryOut
	always_comb begin
		sum <= a ^ b ^ carryIn;
		carryOut <= (a ^ b)&carryIn | (a & b);
	end
endmodule
