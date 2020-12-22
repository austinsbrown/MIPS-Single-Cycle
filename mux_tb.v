`timescale 1ns/1ps
`include "mux.v"

module mux_tb();
    parameter dataCount = 16;

    reg  sel;
    reg  [dataCount-1:0] in1;
    reg  [dataCount-1:0] in2;
    wire [dataCount-1:0] out;

    mux #(.dataCount(16)) uut(sel, in1, in2, out);

    initial begin
        $dumpfile("dump.vcd");                              
        $dumpvars(0, mux_tb);

        sel = 0;
        in1 = 1;
        in2 = 2;

        #1;
        sel = 1;

        #1;
    end

endmodule