module Pipeline_Register (In, Out, clk, reset);

  input logic clk, reset;
  input logic [63:0] In;
  output logic [63:0] Out;

  genvar i;
  generate
    for (i = 0; i < 64; i++) begin : eachDFF
      D_FF pipe (.q(Out[i]), .d(In[i]), .reset, .clk);
    end
  endgenerate

endmodule
