`include "program_counter.v"
`include "instruction_memory.v"
`include "control.v"
`include "registers.v"

module datapath
(
    input clk,
    input reset,
    input RegDst,
    input AluSrc,
    input MemtoReg,
    input RegWrite,
    input MemRead,
    input MemWrite,
    input Branch,
    input [1:0] ALUOp,
    output [5:0] OpCode
);

    

endmodule