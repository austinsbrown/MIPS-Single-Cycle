module instruction_memory
#(
    parameter size = 32,                                      // size of each location
    parameter length = 256                                    // number of locations
)
(
    input  [$clog2(length)-1:0] programCounter,
    output [$clog2(size)-1:0] instruction
);

    reg [$clog2(size)-1:0] mem [$clog2(length)-1:0];
    assign instruction = mem[programCounter];

endmodule