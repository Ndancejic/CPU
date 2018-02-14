module signExtend(in, out, ext);
	input logic [31:0] in;
	input logic [1:0] ext;
	output logic [63:0] out;
	
	always_comb begin
		case(ext)
			2'b00:  if(in[20]) out <= {55'hFFFFFFFFFFFFFF,in[20:12]}; else out<={52'h00000000000000,in[20:12]}; //for D type
			2'b01:	out<={52'h0000000000000,in[21:10]}; //for I type
			2'b10:	if(in[25]) out<={38'hFFFFFFFFFF,in[25:0]}; else out<={38'h0000000000,in[25:0]};// for B type
			2'b11:	if(in[23]) out<= {46'hFFFFFFFFFFFF,in[23:5]}; else out<={46'h000000000000,in[23:5]}; // for CB type
			//default: out <= {32'hFFFFFFFF,in[31:0]}&in[31] | {32'h00000000,in[31:0]}&~in[31];
		endcase	
	end
endmodule

module signExtend_testBench();
	parameter delay = 100000;

	logic [31:0] in;
	logic [63:0] out;

	signExtend si(.in, .out);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);
	initial begin

		$display("%t testing sign Extension", $time);
		in = 32'hFBC39201; #(delay);
		assert(out == 64'hFFFFFFFFFBC39201);
		
		in = 32'h0BC39201; #(delay);
		assert(out == 64'h000000000BC39201);
		
	end
endmodule