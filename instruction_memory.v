module instruction_memory
#(
    parameter size = 32,                                        // size of each location
    parameter length = 256                                      // number of locations
)
(
    input  [$clog2(length)-1:0] programCounter,                 // keeps track of what instruction is to be executed next               
    output [$clog2(size)-1:0] instruction                       // the instruction pointed to by the program counter
);

    reg [$clog2(size)-1:0] mem [$clog2(length)-1:0];            // memory block 
    assign instruction = mem[programCounter];                   

    // todo: add a read command for simulation
endmodule