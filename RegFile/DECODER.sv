// create 1:32 decoder
module DECODER (RegSelect, Select, RegEnable);

	input logic [4:0] Select; //Write register
	input logic RegEnable;
	output logic [31:0] RegSelect;
	
	integer i;
	
	always_comb begin
		for(i = 0; i < 32; i=i+1) //sets all bits of RegSelect to 0
			RegSelect[i] = 0;
			
		RegSelect[Select] = RegEnable; //sets the selected bit to RegEnable
	end

endmodule 
