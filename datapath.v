`include "program_counter.v"
`include "mux.v"
`include "instruction_memory.v"
`include "control.v"
`include "registers.v"
`include "sign_extend.v"

module datapath
(
    input clk,
    input reset
);

    wire clk, reset, RegDst, AluSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;     // control signals
    wire [1:0] ALUOp;
    wire [5:0] OpCode;

    wire [31:0] instruction;                                                            // the instruction read from instruction memory
    wire [31:0] PCIn;                                                                   // input for the pc 
    wire [31:0] PCOut;                                                                  // input for instruction memory
    wire [31:0] operand1, operand2;                                                     // inputs for the alu
    wire [3:0]  ALUControl;                                                             // output of the alu_control module
    wire [4:0]  writeReg;                                                               // output of the mux that feeds into the registers
    wire [31:0] writeData;                                                              // input for registers
    wire [31:0] readData1, readData2;                                                   // output of registers
    wire [31:0] sign_extend;                                                            // output of the sign extend module

    program_counter pc(clk, reset, PCIn, PCOut);
    instruction_memory IMem(PCOut[7:0], instruction);
    mux #(5) writeRegMux(RegDst, instruction[20:16], instruction[15:11], writeReg);
    registers regs
    (
        clk,
        regWrite,
        instruction[25:21],
        instruction[20:16],
        writeReg,
        writeData,
        readData1,
        readData2
    );

    sign_extend se(instruction[15:0], sign_extend);
endmodule