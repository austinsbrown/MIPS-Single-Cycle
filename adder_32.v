module adder_32
(
    input wire  [31:0] a1,
    input wire  [31:0] a2,
    output wire [31:0] result
);

    assign result = a1 + a2;
endmodule