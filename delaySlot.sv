module delaySlot (clk, delay, instr);

  input logic clk;
  input logic [31:0] instr;
  output logic delay;

  always_ff @(posedge clk) begin
    if (instr[31:21] == 11'bxxx101xxxxx | instr[31:21] == 11'b111110000x0) delay <= 1;
    else delay <= 0;
  end

endmodule

module delayInstr (delay, instr, instrDelay);

  input logic delay;
  input logic [31:0] instr;
  output logic [31:0] instrDelay;

  always_comb begin
    if(delay) instrDelay <= 32'b10010001000000000000001111111111;
    else instrDelay <= instr;
  end

endmodule
