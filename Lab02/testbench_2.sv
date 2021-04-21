`include "design.sv"
module testbench ;
  reg [3:0] a, b;
    reg cin ;
  wire [3:0] sum;
    wire cout ;
    
    four_onebitFullAdder dut (a ,b , cin , sum , cout ) ;
        always
            begin
                #10 a [0] = ~ a [0];
            end
        always
            begin
                #20 a [1] = ~ a [1];
            end
        always
            begin
                #40 a [2] = ~ a [2];
            end
        always
            begin
                #80 a [3] = ~ a [3];
            end
        initial
        begin
            $dumpfile ("dump.vcd") ;
          $dumpvars (0 ,testbench ) ;
            a [0] = 0;
            a [1] = 0;
            a [2] = 0;
            a [3] = 0;
            b [0] = 0;
            b [1] = 0;
            b [2] = 0;
            b [3] = 0;
            cin = 0;
            #40 b [3] = 1; b [2] = 0; b [3] = 0; b [3] = 1; //b=4 ’ b1001
            #40 b [3] = 0; b [2] = 1; b [3] = 1; b [3] = 1; //b=4 ’ b0111
            #40 b [3] = 0; b [2] = 0; b [3] = 0; b [3] = 0; //b=4 ’ b0111
            cin = 1;
            #160 $finish ;
        end
endmodule