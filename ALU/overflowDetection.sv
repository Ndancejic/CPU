module overflowDetection(a,b,result,overflow, op);
	input logic a, b, result, op; //op = 0 is add and op = 1 is subtract
	output logic overflow;

	//logic for overflow
	always_comb begin
		overflow <= (~a*~b*result*~op|a*b*~result*~op)|(~a*b*result*op|a*~b*~result*op);
	end
endmodule
