// Testbench for 1 -bit adder
`include "design.sv"
module testbench ;
    reg a ,b , cin ;
    wire sum , cout ;
    onebitFullAdder dut (a ,b , cin , sum , cout ) ;
        always
            begin
                #10 b =~ b ;
            end
        always
            begin
                #20 a =~ a ;
            end
        initial
            begin
                $dumpfile ("dump.vcd") ; $dumpvars ;
                a = 0;
                b = 0;
                cin =0;
                #80 cin =1;
                #160 $finish ;
            end
endmodule