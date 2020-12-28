module alu
(
    input  [31:0] operand1,
    input  [31:0] operand2,
    input  [3:0]  aluOP,
    output reg [31:0] result,
    output zeroFlag                                 // set to 1 if the result is 0
);

    assign zeroFlag = (result==0)?1:0;

    always @(aluOP or operand1 or operand2)begin
        case(aluOP)
            4'b0010: result = operand1 + operand2;
            4'b0110: result = operand1 - operand2;
            4'b0000: result = operand1 & operand2;
            4'b0001: result = operand1 | operand2;
            4'b0111: result = (operand1<operand2)?1:0;
            4'b0110: result = ~(operand1|operand2);
        endcase
    end
endmodule