module control
(
    input [5:0] opcode,
    output reg regDst,
    output reg [1:0] ALUOp,
    output reg ALUSrc,
    output reg branch,
    output reg memRead,
    output reg memWrite,
    output reg regWrite,
    output reg memToReg
    
);
    always @(opcode)begin
        case(opcode)
            6'b000000: {regDst, ALUOp, ALUSrc, branch, memRead, memWrite, regWrite, memToReg} = 9'b110000010;         // for r type instructions
            6'b100011: {regDst, ALUOp, ALUSrc, branch, memRead, memWrite, regWrite, memToReg} = 9'b000101011;         // for l type instructions
            6'b101011: {regDst, ALUOp, ALUSrc, branch, memRead, memWrite, regWrite, memToReg} = 9'bx0010010x;         // for sw
            6'b000100: {regDst, ALUOp, ALUSrc, branch, memRead, memWrite, regWrite, memToReg} = 9'bx0101000x;         // for beq
            default  : {regDst, ALUOp, ALUSrc, branch, memRead, memWrite, regWrite, memToReg} = 9'bxxxxxxxxx; 
        endcase
    end
endmodule