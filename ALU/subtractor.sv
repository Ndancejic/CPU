//subtracts bit b from a
module subtractor(a,b,carryIn,carryOut,sum);
	input logic a,b,carryIn;
	output logic carryOut,sum;

	//assigns difference to sum
	//assigns carry to carryOut
	always_comb begin
		sum <= a^b^carryIn;
		carryOut <= (~a & b) | (~a & carryIn) | (b & carryIn);
	end
endmodule
