module program_counter
(
    input clk, 
    input reset, 
    input branch,                                               // used for branching
    input [31:0] pcIn,                                          // pc input also used for determining branch target
    output reg [31:0] pcOut                                     // curent value of the pc
);
    always @(posedge clk ) begin
        if (reset==1)                                           // if the reset bit is flipped then set the pc to 0
                pcOut<=32'b0;
        else
            if (branch==0) begin                                // if not branching then simply increment the counter.
                pcOut<=pcOut+1;
            end
            if (branch==1) begin
                pcOut<=pcIn+pcOut+1;    
        end
    end
endmodule