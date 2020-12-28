module alu_control
(
    input [1:0] aluOP,
    input [5:0] functField,
    output reg [3:0] aluCtrl
);

    always @(aluOP or functField)begin
        casex({aluOP, functField})
            8'b1x_xx0000: aluCtrl = 4'b0010;        // add 
            8'b1x_xx0010: aluCtrl = 4'b0110;        // sub
            8'b1x_xx0100: aluCtrl = 4'b0000;        // and
            8'b1x_xx0101: aluCtrl = 4'b0001;        // or
            8'b1x_xx1010: aluCtrl = 4'b0111;        // slt
            8'b00_xxxxxx: aluCtrl = 4'b0010;        // lw and sw
            8'b01_xxxxxx: aluCtrl = 4'b0110;        //beq
        endcase
    end

endmodule