module FA(output cout, output s, input a, input b, input cin);
    wire s0, c0, c1;
    HA ha1(c0,s0,a,b);
    HA ha2(c1,s,s0,cin);
    assign
        cout = c0 || c1;
endmodule