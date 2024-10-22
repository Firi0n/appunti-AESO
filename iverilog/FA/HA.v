module HA(output rip, output c, input a, input b);
    assign
        rip = a && b;

    assign
        c = a ^ b;
endmodule