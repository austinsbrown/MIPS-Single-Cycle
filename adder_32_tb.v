`timescale 1s/100ms
`include "adder_32.v"

module adder_32_tb();
    reg  [31:0] a1, a2;
    wire [31:0] result;

    adder_32 test(a1, a2, result);

initial
begin

    $dumpfile("dump.vcd");
    $dumpvars(0, adder_32_tb);

    a1 = 0;
    a2 = 0;

    #1;
    a1 = 1;
    a2 = 0;

    #1;
    a1 = 0;
    a2 = 31;

    #1;
    a1 = 1;
    a2 = 14;

    #1;
end
endmodule