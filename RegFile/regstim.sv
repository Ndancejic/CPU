// Test bench for Register file
`timescale 1ns/10ps

module regstim();

	parameter ClockDelay = 5000;

	logic	[4:0] 	ReadRegister1, ReadRegister2, WriteRegister;
	logic [63:0]	WriteData;
	logic 			RegWrite, clk;
	logic [63:0]	ReadData1, ReadData2;

	integer i;

	// Your register file MUST be named "regfile".
	// Also you must make sure that the port declarations
	// match up with the module instance in this stimulus file.
	regfile dut (.ReadData1, .ReadData2, .WriteData,
					 .ReadRegister1, .ReadRegister2, .WriteRegister,
					 .RegWrite, .clk);

	// Force %t's to print in a nice format.
	initial $timeformat(-9, 2, " ns", 10);

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		// Try to write the value 0xA0 into register 31.
		// Register 31 should always be at the value of 0.
		RegWrite <= 5'd0;
		ReadRegister1 <= 5'd0;
		ReadRegister2 <= 5'd0;
		WriteRegister <= 5'd31;
		WriteData <= 64'h00000000000000A0;
		@(posedge clk);

		$display("%t Attempting overwrite of register 31, which should always be 0", $time);
		RegWrite <= 1;
		@(posedge clk);

		// Write a value into each  register.
		$display("%t Writing pattern to all registers.", $time);
		for (i=0; i<31; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*64'h0000010204080001;
			@(posedge clk);

			RegWrite <= 1;
			@(posedge clk);
		end

		// Go back and verify that the registers
		// retained the data.
		$display("%t Checking pattern.", $time);
		for (i=0; i<32; i=i+1) begin
			RegWrite <= 0;
			ReadRegister1 <= i-1;
			ReadRegister2 <= i;
			WriteRegister <= i;
			WriteData <= i*64'h0000000000000100+i;
			@(posedge clk);
		end
		$stop;
	end
endmodule

module decodeTest();

	logic [4:0] Select; //Write register
	logic RegEnable, clk;
	logic [31:0] RegSelect;

	DECODER dut (.RegSelect, .Select, .RegEnable);

	parameter ClockDelay = 5000;

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		Select <= 00000;
		RegEnable <= 0;
		@(posedge clk);

		Select <= 00101;
		RegEnable <= 1;
		@(posedge clk);

		$stop;
	end

endmodule

module MUXtest();

	logic [63:0] RegData[31:0];
	logic [4:0] ReadSelect;
	logic [63:0] ReadData;
	logic clk;

	MUX64x32 dut (.ReadData, .RegData, .ReadSelect);

	parameter ClockDelay = 5000;

	integer i;

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		ReadSelect <= 00000;
		for (i = 0; i < 32; i++)
			RegData[i] = i;
		@(posedge clk);

		ReadSelect <= 00001;
		@(posedge clk);

		ReadSelect <= 00100;
		@(posedge clk);

		ReadSelect <= 00101;
		@(posedge clk);

		$stop;
	end

endmodule

module RegTest();

	logic [63:0] DataIn;
	logic [31:0] RegEnable;
	logic clk, reset;
	logic [63:0] DataOut[31:0];

	REG_ARRAY dut (.DataOut, .DataIn, .RegEnable, .clk, .reset);

	parameter ClockDelay = 5000;

	integer i;

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		@(posedge clk);
		reset <= 0;
		RegEnable <= 8;
		DataIn <= 8;
		@(posedge clk);

		reset <= 0;
		RegEnable <= 4;
		DataIn <= 64;
		@(posedge clk);

		reset <= 0;
		RegEnable <= 2;
		DataIn <= 8;
		@(posedge clk);

		reset <= 0;
		RegEnable <= 8;
		DataIn <= 2;
		@(posedge clk);

		$stop;
	end

endmodule

module Reg1Test();

	logic [63:0] DataIn;
	logic WriteEn;
	logic clk, reset;
	logic [63:0] DataOut;

	REG_FF dut (.DataOut, .DataIn, .WriteEn, .clk, .reset);

	parameter ClockDelay = 5000;

	integer i;

	initial begin // Set up the clock
		clk <= 0;
		forever #(ClockDelay/2) clk <= ~clk;
	end

	initial begin
		reset <= 1;
		@(posedge clk);
		reset <= 0;
		WriteEn <= 1;
		DataIn <= 32;
		@(posedge clk);

		@(posedge clk);
		reset <= 0;
		WriteEn <= 0;
		@(posedge clk);
		DataIn <= 4;
		@(posedge clk);

		@(posedge clk);
		reset <= 0;
		WriteEn <= 0;
		DataIn <= 10;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		
		@(posedge clk);
		reset <= 0;
		WriteEn <= 1;
		DataIn <= 64;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);

		$stop;
	end

endmodule
