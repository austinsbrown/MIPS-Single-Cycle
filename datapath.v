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

    wire [31:0] instruction                                                         // the instruction read from instruction memory
    wire [31:0] PCIn;                                                               // input for the pc 
    wire [7:0] PCOut;                                                               // input for instruction memory
    wire [31:0] operand1, operand2;                                                 // inputs for the alu
    wire [3:0]  ALUControl;

endmodule