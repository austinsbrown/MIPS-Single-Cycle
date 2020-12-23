module data_memory
#(
    parameter size = 32,                                        // size of each location
    parameter length = 256                                      // number of locations
)
(
    input clk,                                                  // input clock
    input memWrite,                                             // write signal 
    input memRead,                                              // memory read signal
    input [$clog2(length)-1:0] address,                         // address to read/write
    input [size-1:0]  writeData,                                // data to write
    output [size-1:0] readData                                  // data to read
);

    reg [$clog2(size)-1:0] data_memory_block [$clog2(length)-1:0];

    assign readData = data_memory_block[address];

    always @(posedge clk)begin
        if(memWrite == 1'b1)begin
            data_memory_block[address] <= writeData;
        end
    end
endmodule