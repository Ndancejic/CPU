onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /ARMCPU_testbench/armcp/clk
add wave -noupdate /ARMCPU_testbench/armcp/reset
add wave -noupdate /ARMCPU_testbench/armcp/instr
add wave -noupdate /ARMCPU_testbench/armcp/instr_IFetch
add wave -noupdate /ARMCPU_testbench/armcp/instr64
add wave -noupdate -radix unsigned /ARMCPU_testbench/armcp/PC
add wave -noupdate -radix unsigned /ARMCPU_testbench/armcp/PC_IFetch
add wave -noupdate /ARMCPU_testbench/armcp/nextAddr
add wave -noupdate /ARMCPU_testbench/armcp/Reg2Loc
add wave -noupdate /ARMCPU_testbench/armcp/delay
add wave -noupdate /ARMCPU_testbench/armcp/PC_Reg
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ReadData1
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ReadData2
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ReadData1_Reg
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ReadData2_Reg
add wave -noupdate -radix unsigned /ARMCPU_testbench/armcp/Ra
add wave -noupdate -radix unsigned /ARMCPU_testbench/armcp/Ra_Reg
add wave -noupdate -radix unsigned /ARMCPU_testbench/armcp/Rb
add wave -noupdate -radix unsigned /ARMCPU_testbench/armcp/Rb_Reg
add wave -noupdate -radix unsigned /ARMCPU_testbench/armcp/Rw
add wave -noupdate -radix unsigned /ARMCPU_testbench/armcp/Rw_Reg
add wave -noupdate /ARMCPU_testbench/armcp/reg2
add wave -noupdate /ARMCPU_testbench/armcp/opCode
add wave -noupdate /ARMCPU_testbench/armcp/opCode_Reg
add wave -noupdate /ARMCPU_testbench/armcp/negative
add wave -noupdate /ARMCPU_testbench/armcp/zero
add wave -noupdate /ARMCPU_testbench/armcp/overflow
add wave -noupdate /ARMCPU_testbench/armcp/carry_out
add wave -noupdate -childformat {{{/ARMCPU_testbench/armcp/registers/DataOut[12]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[11]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[10]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[9]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[8]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[7]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[6]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[5]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[4]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[3]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[2]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[1]} -radix decimal} {{/ARMCPU_testbench/armcp/registers/DataOut[0]} -radix decimal}} -expand -subitemconfig {{/ARMCPU_testbench/armcp/registers/DataOut[12]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[11]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[10]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[9]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[8]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[7]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[6]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[5]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[4]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[3]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[2]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[1]} {-height 15 -radix decimal} {/ARMCPU_testbench/armcp/registers/DataOut[0]} {-height 15 -radix decimal}} /ARMCPU_testbench/armcp/registers/DataOut
add wave -noupdate /ARMCPU_testbench/armcp/data/mem
add wave -noupdate /ARMCPU_testbench/armcp/negativeIn
add wave -noupdate /ARMCPU_testbench/armcp/zeroIn
add wave -noupdate /ARMCPU_testbench/armcp/overflowIn
add wave -noupdate /ARMCPU_testbench/armcp/carry_outIn
add wave -noupdate /ARMCPU_testbench/armcp/negativeHold
add wave -noupdate /ARMCPU_testbench/armcp/zeroHold
add wave -noupdate /ARMCPU_testbench/armcp/overflowHold
add wave -noupdate /ARMCPU_testbench/armcp/carry_outHold
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ALUimm64
add wave -noupdate /ARMCPU_testbench/armcp/brAddr64
add wave -noupdate /ARMCPU_testbench/armcp/cbAddr64
add wave -noupdate /ARMCPU_testbench/armcp/dtAddr64
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ALUimm64_Reg
add wave -noupdate /ARMCPU_testbench/armcp/brAddr64_Reg
add wave -noupdate /ARMCPU_testbench/armcp/cbAddr64_Reg
add wave -noupdate /ARMCPU_testbench/armcp/dtAddr64_Reg
add wave -noupdate /ARMCPU_testbench/armcp/shiftDir
add wave -noupdate /ARMCPU_testbench/armcp/UncondBr
add wave -noupdate /ARMCPU_testbench/armcp/MemToReg_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/BrTaken_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/UncondBr_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/shiftDir_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/RegWriteEn_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/MemWrite_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/MemReadEn_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/idex/EX
add wave -noupdate /ARMCPU_testbench/armcp/ALUOp_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/ALUOp
add wave -noupdate /ARMCPU_testbench/armcp/ALUSrc_ctrl
add wave -noupdate /ARMCPU_testbench/armcp/ALUSrc
add wave -noupdate /ARMCPU_testbench/armcp/MEM_Reg
add wave -noupdate /ARMCPU_testbench/armcp/WB_Reg
add wave -noupdate /ARMCPU_testbench/armcp/shiftedVal
add wave -noupdate /ARMCPU_testbench/armcp/multRes
add wave -noupdate /ARMCPU_testbench/armcp/mult_high
add wave -noupdate /ARMCPU_testbench/armcp/shamt
add wave -noupdate /ARMCPU_testbench/armcp/Rw_Exec
add wave -noupdate /ARMCPU_testbench/armcp/shiftedBrAddr
add wave -noupdate /ARMCPU_testbench/armcp/shiftedcb
add wave -noupdate /ARMCPU_testbench/armcp/brAddr
add wave -noupdate /ARMCPU_testbench/armcp/brPass
add wave -noupdate /ARMCPU_testbench/armcp/brRes
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/inputB
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ALUresult
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ALUresult_Exec
add wave -noupdate /ARMCPU_testbench/armcp/ReadData2_Exec
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ALUIn1
add wave -noupdate -radix decimal /ARMCPU_testbench/armcp/ALUIn2
add wave -noupdate /ARMCPU_testbench/armcp/cntrl
add wave -noupdate /ARMCPU_testbench/armcp/BrTaken
add wave -noupdate /ARMCPU_testbench/armcp/MemReadEn
add wave -noupdate /ARMCPU_testbench/armcp/MemWrite
add wave -noupdate /ARMCPU_testbench/armcp/WB_Exec
add wave -noupdate /ARMCPU_testbench/armcp/ForwardA
add wave -noupdate /ARMCPU_testbench/armcp/ForwardB
add wave -noupdate /ARMCPU_testbench/armcp/xfer_size
add wave -noupdate /ARMCPU_testbench/armcp/Rw_Mem
add wave -noupdate /ARMCPU_testbench/armcp/MemRead
add wave -noupdate /ARMCPU_testbench/armcp/MemToReg
add wave -noupdate /ARMCPU_testbench/armcp/RegWriteEn
add wave -noupdate /ARMCPU_testbench/armcp/writeRegData
add wave -noupdate /ARMCPU_testbench/armcp/delay
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {94931356 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 271
configure wave -valuecolwidth 76
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
WaveRestoreZoom {23372228 ps} {107187860 ps}
