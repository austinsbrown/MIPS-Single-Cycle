`define opcode   instr[31:26]
`define sr1      instr[25:21]
`define sr2      instr[20:16]
`define f_code   instr[5:0]
`define numshift instr[10:6]

module alu
(
    input CLK,                                              // clock signal
    input RST,                                              // reset
    output reg CS,                                          // when CS is enabled and WE is enabled data is read
    output reg WE,                                          // when WE and CS are active, data is stored 
    output [31:0] ADDR,                                     // memory address
    inout  [31:0] Mem_Bus                                   // memory bus
);
    parameter add  = 6'b100000;                             // instruction set
    parameter sub  = 6'b100010;
    parameter xor1 = 6'b100110;
    parameter and1 = 6'b100100;
    parameter or1  = 6'b100101;
    parameter slt  = 6'b101010;
    parameter srl  = 6'b000010;
    parameter sll  = 6'b000000;
    parameter jr   = 6'b001000;

    parameter addi = 6'b001000;
    parameter andi = 6'b001100;
    parameter ori  = 6'b001101;
    parameter lw   = 6'b100011;
    parameter sw   = 6'b101011;
    parameter beq  = 6'b000100;
    parameter bne  = 6'b000101;
    parameter j    = 6'b000010;

    parameter R = 2'd0;                                     // instruction formats
    parameter I = 2'd1;
    parameter J = 2'd2;

    reg [5:0] op, opsave;                                   // alu operation select                                      
    reg [31:0] instr, pc, npc, alu_result;                  // current instruction, program counter, next program counter, result from the alu 
    reg [31:0] alu_or_mem, alu_result_save, writing;
    reg [2:0]  state, nstate;
    reg fetchDorI, regw, reg_or_imm, reg_or_imm_save, alu_or_mem_save;                                   
    

    wire [1:0]  format;                                     // specifies what format the instruction is in
    wire [31:0] imm_ext;                                    // sign extended representation of instruction
    wire [4:0]  dr;                                         // address of destination register
    wire [31:0] alu_in_A, alu_in_B, readReg1, readReg2;
    wire [31:0] reg_in;
       
    assign imm_ext = (instr[15] == 1) ? {16'hFFFF, instr[15:0]} : {16'h0000, instr[15:0]};                               
    assign dr = (format == R) ? instr[15:11] : instr[20:16];

    assign alu_in_A = readReg1;
    assign alu_in_B = (alu_or_mem_save) ? imm_ext : readReg2;
    assign reg_in = (alu_or_mem_save) ? Mem_Bus : alu_result_save;

    assign format = (`opcode ==6'd0) ? R :((`opcode == 6'd2) ? J : I);
    assign Mem_Bus = (writing) ? readReg2 : 32'bZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ;
    assign ADDR = (fetchDorI) ? pc : alu_result_save;

    initial begin                                           // initialize everything
        op = and1;
        opsave = and1;

        state = 3'b0;
        nstate = 3'b0;

        alu_or_mem = 0;
        regw = 0;
        fetchDorI = 0;
        writing = 0;
        reg_or_imm = 0;
        reg_or_imm_save = 0;
    end

    always @(*)
    begin
        fetchDorI = 0; CS = 0; WE = 0; regw = 0; writing = 0; alu_result = 32'd0;
        npc = pc; op = jr; reg_or_imm = 0; alu_or_mem = 0;

        case(state)
            0:
            begin
                npc = pc + 32'd1;                                       // increment program counter
                CS = 1;                                                 // chip select to read
                nstate = 3'd1;                                          // go to decode state
                fetchDorI = 1;                                          // set ADDR to read
            end

            1:
            begin
                nstate = 3'd2; reg_or_imm = 0; alu_or_mem = 0;
                if(format == J)                                         // jump and finish
                begin
                    npc = {pc[31:26], instr[25:0]};
                    nstate = 3'b0;                                      // transition to fetch
                end

                else if(format == R)                                    // reg instructions
                begin
                    op = `f_code;
                end

                else if(format == )
            end
        endcase
    end
endmodule