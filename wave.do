onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ARMCPU_testbench/armcp/clk
add wave -noupdate /ARMCPU_testbench/armcp/reset
add wave -noupdate /ARMCPU_testbench/armcp/Reg2Loc
add wave -noupdate /ARMCPU_testbench/armcp/MemToReg
add wave -noupdate /ARMCPU_testbench/armcp/BrTaken
add wave -noupdate /ARMCPU_testbench/armcp/UncondBr
add wave -noupdate /ARMCPU_testbench/armcp/shiftDir
add wave -noupdate /ARMCPU_testbench/armcp/RegWriteEn
add wave -noupdate /ARMCPU_testbench/armcp/MemWrite
add wave -noupdate /ARMCPU_testbench/armcp/ALUOp
add wave -noupdate /ARMCPU_testbench/armcp/ALUSrc
add wave -noupdate /ARMCPU_testbench/armcp/instr
add wave -noupdate /ARMCPU_testbench/armcp/PC
add wave -noupdate /ARMCPU_testbench/armcp/brAddr
add wave -noupdate /ARMCPU_testbench/armcp/nextAddr
add wave -noupdate /ARMCPU_testbench/armcp/brAddr64
add wave -noupdate /ARMCPU_testbench/armcp/ReadData1
add wave -noupdate /ARMCPU_testbench/armcp/ReadData2
add wave -noupdate /ARMCPU_testbench/armcp/Ra
add wave -noupdate /ARMCPU_testbench/armcp/Rb
add wave -noupdate /ARMCPU_testbench/armcp/Rw
add wave -noupdate /ARMCPU_testbench/armcp/writeRegData
add wave -noupdate -childformat {{{/ARMCPU_testbench/armcp/registers/DataOut[31]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[30]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[29]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[28]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[27]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[26]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[25]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[24]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[23]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[22]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[21]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[20]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[19]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[18]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[17]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[16]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[15]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[14]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[13]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[12]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[11]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[10]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[9]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[8]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[7]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[6]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[5]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[4]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[3]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[2]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[1]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[0]} -radix decimal}} -expand -subitemconfig {{/ARMCPU_testbench/armcp/registers/DataOut[31]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[30]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[29]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[28]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[27]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[26]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[25]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[24]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[23]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[22]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[21]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[20]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[19]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[18]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[17]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[16]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[15]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[14]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[13]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[12]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[11]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[10]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[9]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[8]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[7]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[6]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[5]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[4]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[3]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[2]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[1]} {-radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[0]} {-radix decimal}} /ARMCPU_testbench/armcp/registers/DataOut
add wave -noupdate /ARMCPU_testbench/armcp/opCode
add wave -noupdate /ARMCPU_testbench/armcp/inputB
add wave -noupdate /ARMCPU_testbench/armcp/ALUresult
add wave -noupdate /ARMCPU_testbench/armcp/cntrl
add wave -noupdate /ARMCPU_testbench/armcp/negative
add wave -noupdate /ARMCPU_testbench/armcp/zero
add wave -noupdate /ARMCPU_testbench/armcp/overflow
add wave -noupdate /ARMCPU_testbench/armcp/carry_out
add wave -noupdate /ARMCPU_testbench/armcp/ALUimm
add wave -noupdate /ARMCPU_testbench/armcp/ALUimm64
add wave -noupdate /ARMCPU_testbench/armcp/xfer_size
add wave -noupdate /ARMCPU_testbench/armcp/MemRead
add wave -noupdate /ARMCPU_testbench/armcp/instr64
add wave -noupdate /ARMCPU_testbench/armcp/shiftedAddr
add wave -noupdate /ARMCPU_testbench/armcp/shiftedVal
add wave -noupdate /ARMCPU_testbench/armcp/shamt
add wave -noupdate /ARMCPU_testbench/armcp/multRes
add wave -noupdate /ARMCPU_testbench/armcp/mult_high
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7134676234 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {92001392806 ps} {108315716169 ps}
