module program_counter
(
    input clk, 
    input reset, 
    input [31:0] pcIn,                                          // pc input also used for determining branch target
    output reg [31:0] pcOut                                     // curent value of the pc
);
    always @(posedge clk ) begin
        if (reset==1)                                           // if the reset bit is flipped then set the pc to 0
                pcOut<=32'b0;
        else
            pcOut <= pcIn + 1; 
    end
endmodule