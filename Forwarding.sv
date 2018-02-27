module Forwarding (clk, reset, EX_MEM_RegWrite, MEM_WB_RegWrite, EX_MEM_Rw,
  MEM_WB_Rw, ID_EX_Ra, ID_EX_Rb, ForwardA, ForwardB);

  input logic clk, reset;
  input logic EX_MEM_RegWrite;
  input logic MEM_WB_RegWrite;
  input logic [4:0] EX_MEM_Rw;
  input logic [4:0] MEM_WB_Rw;
  input logic [4:0] ID_EX_Ra;
  input logic [4:0] ID_EX_Rb;
  output logic [1:0] ForwardA, ForwardB;


  always_comb begin
	//Forward A logic
  if(EX_MEM_RegWrite & (EX_MEM_Rw == ID_EX_Ra) & (EX_MEM_Rw != 5'b11111))
		ForwardA <= 2'b10; // EX Hazard
	else if(MEM_WB_RegWrite & (EX_MEM_Rw != ID_EX_Ra | EX_MEM_RegWrite==0) & (MEM_WB_Rw == ID_EX_Ra))
		ForwardA <= 2'b01; //Mem Hazard
	else
		ForwardA <= 2'b00;

	//Forward B logic
  if(EX_MEM_RegWrite & (EX_MEM_Rw == ID_EX_Rb) & (EX_MEM_Rw != 5'b11111))
      ForwardB <= 2'b10;// EX Hazard
	else if(MEM_WB_RegWrite & (EX_MEM_Rw != ID_EX_Rb | EX_MEM_RegWrite==0) & (MEM_WB_Rw == ID_EX_Rb))
		ForwardB <= 2'b01; //Mem Hazard
    else
		ForwardB <= 2'b00;
	//end
  end

endmodule
