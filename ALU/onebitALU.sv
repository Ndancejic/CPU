// one bit alu
module onebitALU (a, b, carryIn, op, Result, carryOut);
	input logic a,b,carryIn;
	input logic [2:0] op;
	output logic Result, carryOut;

	logic sum, sub, carryOutSum, carryOutSub;

	//adds the bits
	adder add0(a,b,carryIn,carryOutSum,sum);
	//subtracts the bits
	subtractor sub0(a,b,carryIn,carryOutSub,sub);

	//returns results depending on opcode
	always_comb begin
		case(op)
			3'b000:	begin Result <= b; carryOut <= 0; end
			3'b010:	begin Result <= sum; carryOut <= carryOutSum; end
			3'b011:	begin Result <= sub; carryOut <= carryOutSub; end
			3'b100:	begin Result <= a&b; carryOut <= 0;end
			3'b101:  begin Result <= a|b; carryOut <= 0; end
			3'b110:	begin Result <= a^b; carryOut <= 0; end
			default: begin Result <= 0; carryOut <= 0; end
		endcase
	end
endmodule
