module test;
    reg  a;
    reg  b;
    reg ripin;
    wire ripout;
    wire c;

    integer i;

    FA adder(ripout, c, a, b, ripin);

    initial
        begin
            a = 0;
            b = 0;
            ripin = 0;

            $dumpfile("test_FA_main.vcd");
            $dumpvars;

            for(i=0; i<8; i=i+1)
                begin
                    #2 {a, b, ripin} = i;
                    #1 $display("%b %b %b => risultato: %b, riporto %b", a, b, ripin, c, ripout);
                end
            $finish;
        end
endmodule