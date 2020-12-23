`timescale 1s/100ms
`include "shift_left_2.v"

module shift_left_2_tb();
    reg  [31:0] in;
    wire [31:0] out;

    shift_left_2 uut(in, out);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, shift_left_2_tb);

        in = 2;
        #1;

        in = 5;
        #1;
    end
endmodule