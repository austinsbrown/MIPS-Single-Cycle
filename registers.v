module registers
(
    input         clk,
    input         regWrite,                                     // register write signal
    input  [4:0]  rr1,                                          // read register 1, instr[25-21]
    input  [4:0]  rr2,                                          // read register 2, instr[20-16]      
    input  [4:0]  writeReg,                                     // write register, either instr[20-16] or [15-11]    
    input  [31:0] writeData,   
    output [31:0] readData1,
    output [31:0] readData2                  
);

    reg [31:0] memoryBlock [31:0];                              // 32 32 bit registers

    assign readData1 = (rr1 != 0)? memoryBlock[rr1]:0;          // read the data from the registers pointed by rr1 and rr2
    assign readData2 = (rr2 != 0)? memoryBlock[rr2]:0;

    always @(posedge clk)begin                                  // write data to registers
        if(regWrite == 1'b1)begin
            memoryBlock[writeReg] <= writeData;
        end
    end

endmodule