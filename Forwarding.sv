module Forwarding (EX_MEM_RegWrite, MEM_WB_RegWrite, EX_MEM_Rw,
  MEM_WB_Rw, ID_EX_Ra, ID_EX_Rb, ForwardA, ForwardB);

  input logic EX_MEM_RegWrite;
  input logic MEM_WB_RegWrite;
  input logic [4:0] EX_MEM_Rw;
  input logic [4:0] MEM_WB_Rw;
  input logic [4:0] ID_EX_Ra;
  input logic [4:0] ID_EX_Rb;
  output logic [1:0] ForwardA, ForwardB;

  always_comb begin

    //Forward A logic
    if(EX_MEM_RegWrite && (EX_MEM_Rw != 0) && (EX_MEM_Rw == ID_EX_Ra))
      ForwardA = 10; // EX Hazard

    else if(MEM_WB_RegWrite && (MEM_WB_Rw != 0) && (EX_MEM_Rw != ID_EX_Ra)
      && (MEM_WB_Rw == ID_EX_Ra)) ForwardA = 01; //Mem Hazard

    else ForwardA = 00;

    //Forward B logic
    if(EX_MEM_RegWrite && (EX_MEM_Rw != 0) && (EX_MEM_Rw == ID_EX_Rb))
      ForwardB = 10;// EX Hazard

    else if(MEM_WB_RegWrite && (MEM_WB_Rw != 0) && (EX_MEM_Rw != ID_EX_Rb)
      && (MEM_WB_Rw == ID_EX_Rb)) ForwardB = 01; //Mem Hazard

    else ForwardB = 00;

  end

endmodule
