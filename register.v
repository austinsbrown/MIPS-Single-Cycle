module Register(clk, regW, DR, SR1, SR2, regIn, readReg1, readReg2);    
    input           clk, regW;                                      // clock pulse and write bit
    input [4:0]     DR;                                             // which register to write to       
    input [4:0]     SR1, SR2;                                       // what register to read from                                                       
    input [31:0]    regIn;                                          // what to write to the register

    output reg [31:0] readReg1, readReg2;                           // outputs

    integer i;                                                      // counter for loop
    reg [31:0] mainReg [0:31];
    initial begin                                                   // initialize stuff to 0
        readReg1 = 0;                           
        readReg2 = 0;
        for(i=0; i<32; i++)
        begin
            mainReg[1] = 0;
        end
    end

    always @(posedge clk)
    begin
        if(regW == 1'b1)                                            // if write bit is set...                                         
            mainReg[DR] <= regIn;                                   // write to index DR

        readReg1 <= mainReg[SR1];                                   // read from loaction SR
        readReg2 <= mainReg[SR2];
    end

endmodule 