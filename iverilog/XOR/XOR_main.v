module test;
    reg  a;
    reg  b;
    wire c;

    integer i;

    XOR x(c, a, b);

    initial
        begin
            a = 0;
            b = 0;

            $dumpfile("test_XOR_main.vcd");
            $dumpvars;

            for(i=0; i<4; i=i+1)
                begin
                    #2 {a, b} = i;
                    #1 $display("%b %b => risultato: %b", a, b, c);
                end
            $finish;
        end
endmodule