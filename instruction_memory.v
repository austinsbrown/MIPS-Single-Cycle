module instruction_memory
#(
    parameter size = 32,                                        // size of each location
    parameter length = 256                                      // number of locations
)
(
    input  [$clog2(length)-1:0] programCounter,                 // keeps track of what instruction is to be executed next               
    output [size-1:0] instruction_address                       // the instruction pointed to by the program counter
);

    reg [size-1:0] mem [length-1:0];                            // memory block 
    assign instruction_address = mem[programCounter];                   

    initial begin
        $readmemh("instruction_memory.dat", mem);
    end
    
endmodule