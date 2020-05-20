module memory(CS, WE, clk, ADDR, bus);
    input CS;                                                   // chip select. enables reading/writing from ram
    input WE;                                                   // write enable. enables writting to ram
    input clk;                                                  
    input [31:0] ADDR;                                          // holds address of what section in ram to access
    input [31:0] bus;                                           // connects ALU and ram

    reg [31:0] ram [0:127];       
    reg [31:0] out;                           
    integer i;                                              

    initial 
    begin
        for(i=0; i<128; i++)                                    // initialize ram to 0
        begin
            ram[i] = 32'b0;
        end
        $readmemh("instructions.txt", ram);                     // read instructions from text file
    end

    assign bus = ((CS == 1'b0) || (WE == 1'b1)) ? 32'bZ : out;

    always @(negedge clk)
    begin
        if(CS == 1'b1 && WE == 1'b1)
            ram[ADDR] <= bus;
        out <= ram[ADDR];
    end
endmodule