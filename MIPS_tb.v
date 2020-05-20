`timescale 1ns/100ps
`include "register.v"

module register_tb();
    reg           clk=0, regW;                                      
    reg [4:0]     DR;                                                  
    reg [4:0]     SR1, SR2;                                                                                           
    reg [31:0]    regIn;                                         
    wire [31:0] readReg1, readReg2; 

    Register uut
    (
        .clk(clk),
        .regW(regW),
        .DR(DR),
        .SR1(SR1), 
        .SR2(SR2),
        .regIn(regIn),
        .readReg1(readReg1),
        .readReg2(readReg2)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, register_tb);

        regW = 1;
        DR = 0;
        SR1 = 0;
        SR2 = 0;
        regIn = 5;
        #10;

        DR = 1;
        SR2 = 1;
        regIn = 200;
        #10;
            
    end

    always
    #5  clk = ! clk; 

    initial 
        #100  $finish; 

endmodule 
