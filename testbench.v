`timescale 1s/100ns
`include "program_counter.v"

module testbench();
    reg clk, reset;
    reg [31:0] pcIn;
    wire [31:0] pcOut;

    program_counter pc(clk, reset, pcIn, pcOut);

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        clk = 0;
        reset = 0;
        pcIn = 0;
        #100;

        reset = 1;
        #10;

        reset = 0;
        pcIn = 20;
        #10;
    end

    always
    #5  clk = ! clk; 

    initial 
        #150  $finish; 
endmodule