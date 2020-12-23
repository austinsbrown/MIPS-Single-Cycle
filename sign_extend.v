module sign_extend(in, out);                        // sign extend from 16 bit to 32 bit
    input  [15:0] in;
    output [31:0] out;

    assign out = {{16 {in [ 15 ]}},in};

endmodule