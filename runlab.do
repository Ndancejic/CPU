# Create work library
vlib work

# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./ARMCPU.sv"
vlog "./ALUControl.sv"
vlog "./control.sv"
vlog "./RegFile/regfile.sv"
vlog "./ALU/ARMALU.sv"
vlog "./math.sv"
vlog "./RegFile/DECODER.sv"
vlog "./RegFile/REG_ARRAY.sv"
vlog "./RegFile/MUX64x32.sv"
vlog "./ALU/onebitALU.sv"
vlog "./ALU/overflowDetection.sv"
vlog "./datamem.sv"
vlog "./instructmem.sv"
vlog "./ALU/adder.sv"
vlog "./ALU/subtractor.sv"
vlog "./signExtend.sv"
vlog "./muxes.sv"
vlog "./Pipeline_Register.sv"
vlog "./Forwarding.sv"
vlog "./delaySlot.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work ARMCPU_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do cpu_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
