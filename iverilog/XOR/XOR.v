module XOR(output c, input a, input b);
    assign
        c = (!a && b) || (a && !b);
endmodule