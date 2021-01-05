`include "program_counter.v"
`include "instruction_memory.v"
`include "control.v"
`include "registers.v"
`include "mux.v"

module datapath
(
    input reset,
    input clk
);

    wire regDst, branch, memRead, memToReg, memWrite, aluSrc, regWrite;                         // control wires
    wire [1:0]  aluOP;                                                                          
    wire [31:0] signExtend;                                                                     // output of signExtend module
    wire [31:0] instruction_address;                                                            // output of the program counter
    wire [31:0] instruction;                                                                    // the instruction to be executed
    wire [31:0] readReg1, readReg2;
    wire [31:0] aluOut;                                                                         // result of the alu
    wire [31:0] readData;                                                                       // result of reading data memory
    wire [4:0]  regMux;
    wire [31:0] aluMux, memMux, pcIn;
    wire [31:0] shiftLeftAdder, SimpleAdder;
    wire andOut;

    mux #(5)  intoReg(regDst, instruction[20:16], instruction[15:11], regMux);                  // multiplexer that feeds into the regesters
    mux #(32) intoALU(aluSrc, readReg2, signExtend, aluMux);                                    // multiplexer that feeds into the alu
    mux #(32) outMem(memToReg, aluOut, readData, memMux);                                       // multiplexer that takes output from alu and mem 
    mux #(32) pcMux(andOut, SimpleAdder, shiftLeftAdder, pcIn);                                 // mux that feeds into the program counter

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
endmodule