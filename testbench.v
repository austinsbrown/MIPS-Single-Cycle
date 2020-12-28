`timescale 1s/100ns
`include "alu.v"

module testbench();
    
    reg [31:0] operand1;
    reg [31:0] operand2;
    reg [3:0]  aluOP;
    wire[31:0] result;
    wire zeroFlag;     

    alu alu_uut(operand1, operand2, aluOP, result, zeroFlag);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        operand1 = 3;
        operand2 = 2;
        aluOP = 4'b0010;
        #10;

        operand1 = 3;
        operand2 = 3;
        aluOP = 4'b0110;
        #10;

        operand1 = 4'b1111;
        operand2 = 4'b0000;
        aluOP = 4'b0000;
        #10;

        operand1 = 4'b1111;
        operand2 = 4'b0000;
        aluOP = 4'b0001;
        #10;

        operand1 = 4'b1111;
        operand2 = 4'b0000;
        aluOP = 4'b0111;
        #10;

        operand1 = 4'b1111;
        operand2 = 4'b0000;
        aluOP = 4'b0110;
        #10;

    end

    /*always
    #5  clk = ! clk; 

    initial 
        #150  $finish; */
endmodule