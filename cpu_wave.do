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
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/PC
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/brAddr
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/nextAddr
add wave -noupdate /ARMCPU_testbench/armcp/brAddr64
add wave -noupdate /ARMCPU_testbench/armcp/ReadData1
add wave -noupdate /ARMCPU_testbench/armcp/ReadData2
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/Ra
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/Rb
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/Rw
add wave -noupdate /ARMCPU_testbench/armcp/writeRegData
add wave -noupdate -childformat {{{/ARMCPU_testbench/armcp/registers/DataOut[31]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[30]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[29]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[28]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[27]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[26]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[25]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[24]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[23]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[22]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[21]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[20]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[19]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[18]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[17]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[16]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[15]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[14]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[13]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[12]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[11]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[10]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[9]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[8]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[7]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[6]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[5]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[4]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[3]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[2]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[1]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[0]} -radix decimal}} -expand -subitemconfig {{/ARMCPU_testbench/armcp/registers/DataOut[31]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[30]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[29]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[28]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[27]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[26]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[25]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[24]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[23]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[22]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[21]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[20]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[19]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[18]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[17]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[16]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[15]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[14]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[13]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[12]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[11]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[10]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[9]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[8]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[7]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[6]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[5]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[4]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[3]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[2]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[1]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[0]} {-height 15 -radix decimal}} /ARMCPU_testbench/armcp/registers/DataOut
add wave -noupdate -childformat {{{/ARMCPU_testbench/armcp/data/mem[72]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[64]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[56]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[48]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[40]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[32]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[24]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[16]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[15]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[14]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[13]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[12]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[11]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[10]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[9]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[8]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[7]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[6]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[5]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[4]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[3]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[2]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[1]} -radix decimal} {{/ARMCPU_testbench/armcp/data/mem[0]} -radix decimal}} -subitemconfig {{/ARMCPU_testbench/armcp/data/mem[72]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[64]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[56]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[48]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[40]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[32]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[24]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[16]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[15]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[14]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[13]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[12]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[11]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[10]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[9]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[8]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[7]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[6]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[5]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[4]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[3]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[2]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[1]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/data/mem[0]} {-height 15 -radix decimal}} /ARMCPU_testbench/armcp/data/mem
add wave -noupdate /ARMCPU_testbench/armcp/opCode
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/inputB
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ALUresult
add wave -noupdate /ARMCPU_testbench/armcp/cntrl
add wave -noupdate /ARMCPU_testbench/armcp/negative
add wave -noupdate /ARMCPU_testbench/armcp/zero
add wave -noupdate /ARMCPU_testbench/armcp/overflow
add wave -noupdate /ARMCPU_testbench/armcp/carry_out
add wave -noupdate /ARMCPU_testbench/armcp/ALUimm64
add wave -noupdate /ARMCPU_testbench/armcp/xfer_size
add wave -noupdate /ARMCPU_testbench/armcp/MemRead
add wave -noupdate /ARMCPU_testbench/armcp/shiftedVal
add wave -noupdate /ARMCPU_testbench/armcp/shamt
add wave -noupdate /ARMCPU_testbench/armcp/multRes
add wave -noupdate /ARMCPU_testbench/armcp/mult_high
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/brRes
add wave -noupdate /ARMCPU_testbench/armcp/ReadData1_Reg
add wave -noupdate /ARMCPU_testbench/armcp/ReadData2_Reg
add wave -noupdate /ARMCPU_testbench/armcp/opCode_Reg
add wave -noupdate /ARMCPU_testbench/armcp/MEM_Reg
add wave -noupdate /ARMCPU_testbench/armcp/WB_Reg
add wave -noupdate /ARMCPU_testbench/armcp/Rw_Exec
add wave -noupdate /ARMCPU_testbench/armcp/WB_Exec
add wave -noupdate /ARMCPU_testbench/armcp/writeRegData
add wave -noupdate /ARMCPU_testbench/armcp/ALUIn1
add wave -noupdate /ARMCPU_testbench/armcp/ALUIn2
add wave -noupdate /ARMCPU_testbench/armcp/inputB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12500000000 ps} 0}
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
WaveRestoreZoom {4883511142447 ps} {5014025729345 ps}
