`include "program_counter.v"
`include "instruction_memory.v"
`include "control.v"
`include "registers.v"

module datapath
(
    input reset,
    input clk
);

    wire regDst, branch, memRead, memToReg, memWrite, aluSrc, regWrite;
    wire [1:0]  aluOP;
    wire [31:0] signExtend;
    wire [31:0] instruction_address;
    wire [31:0] instruction;

    program_counter pc(clk, reset, branch, signExtend, instruction_address);
    instruction_memory iMem(instruction_address[7:0], instruction);
    control cont
    (
        instruction[31:26],
        regDst,
        aluOP,
        aluSrc,
        branch,
        memRead,
        memWrite,
        regWrite,
        memToReg
    );

    registers regs
    (
        clk,
        regWrite,
        instruction[25:21],
        instruction[20:16],
    );

endmodule