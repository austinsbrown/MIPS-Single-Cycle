`timescale 1s/100ms
`include "sign_extend.v"

module sign_extend_tb();
    reg  [15:0] in;
    wire [31:0] out;

    sign_extend uut(in, out);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, sign_extend_tb);

        in = 15;
        #1;

        in = -15;
        #1;
    end
endmodule