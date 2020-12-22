module mux#(parameter dataCount=16)
(
    input sel, 
    input  [dataCount-1:0] in1,
    input  [dataCount-1:0] in2,
    output [dataCount-1:0] out
);

    assign out = (sel == 0)? in1:in2;

endmodule