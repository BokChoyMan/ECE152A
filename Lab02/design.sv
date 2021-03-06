// AND Module
module AND ( input a , input b , output reg c ) ;
always@ ( a or b )
    begin
        c = a & b ;
    end
endmodule

// NOT Module
module NOT ( input a , output reg b ) ;
    assign b=~a;
endmodule

// OR Module
module OR ( input a , input b , output reg c );
    always @(a or b) begin
        c=a|b;
    end
endmodule

// XOR Module
module XOR ( input a , input b , output reg c ) ;
    always @(a or b) begin
        c=a^b;
    end
endmodule

//1 -bit Full Adder
module onebitFullAdder ( 
    input a , 
    input b , 
    input cin , 
    output reg sum ,
    output reg cout ) ;

    wire bXc,s;

    //SUM
    XOR X0(
        .a  (b),
        .b  (cin),
        .c  (bXc)
    );
    XOR X1(
        .a  (a),
        .b  (bXc),
        .c  (sum)
    );

    wire ab,bc,ac,x,out;
    //CARRY
    AND A0(
        .a  (a),
        .b  (b),
        .c  (ab)
    );
    AND A1(
        .a  (b),
        .b  (cin),
        .c  (bc)
    );
    AND A2(
        .a  (a),
        .b  (cin),
        .c  (ac)
    );

    OR O0(
        .a  (ab),
        .b  (bc),
        .c  (x)
    );

    OR O1(
        .a  (x),
        .b  (ac),
        .c  (cout)
    );


endmodule

//4 -bit Adder comprised of cascaded 1 -bit Full Adders
module four_onebitFullAdder ( input [3:0] a , input [3:0] b , input cin ,
    output reg [3:0] sum , output reg cout );

    wire c1,c2,c3;
    onebitFullAdder A0(
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .sum(sum[0]),
        .cout(c1)
    );
    onebitFullAdder A1(
        .a(a[1]),
        .b(b[1]),
        .cin(c1),
        .sum(sum[1]),
        .cout(c2)
    );
    onebitFullAdder A2(
        .a(a[2]),
        .b(b[2]),
        .cin(c2),
        .sum(sum[2]),
        .cout(c3)
    );
    onebitFullAdder A3(
        .a(a[3]),
        .b(b[3]),
        .cin(c3),
        .sum(sum[3]),
        .cout(cout)
    );
    

endmodule

module twobitFullAdder ( 
    input [1:0] a, 
    input [1:0] b, 
    input cin , 
    output reg [1:0] sum,
    output reg cout );

    //s0
    /*
    wire x;
    XOR xo1(
        .a(a[0]),
        .b(b[0]),
        .c(x)
    );
    XOR xo2(
        .a(x),
        .b(cin),
        .c(sum[0])
    );
    */
    assign sum[0] = a[0]^cin^b[0];
   
    //cout
    assign cout = (~cin&(b[1]&b[0])|cin&(b[0]+b[1]))&(a[0]|a[1]);

    //s1
    assign sum[1] = (~(b[1]+a[1]))&(b[0]&a[0]) | (~cin)&(~b[1])&(a[1])&(~b[0]) | (~cin)&(~b[1])&(a[1])&(~a[0])
    | (~b[1])&(a[1])&(~b[0])&(~a[0])| (~cin)&(b[1])&(~a[1])&(~b[0])| (~cin)&(b[1])&(~a[1])&(~a[0])| (b[1])&(~a[1])&(~b[0])&(~a[0])
    | (b[1])&(a[1])&(b[0])&(a[0])| (cin)&(~b[1])&(~a[1])&(a[0])| (cin)&(~b[1])&(~a[1])&(b[0])| (cin)&(b[1])&(a[1])&(a[0])| (cin)&(b[1])&(a[1])&(b[0]);


endmodule

module fourBitAdder_TwoByTwo ( input [3:0] a , input [3:0] b , input cin ,
    output reg [3:0] sum , output reg cout );

    wire out;

    twobitFullAdder add1(
        .a(a[1:0]),
        .b(b[1:0]),
        .cin(cin),
        .sum(sum[1:0]),
        .cout(out)
    );
    
    twobitFullAdder add2(
        .a(a[3:2]),
        .b(b[3:2]),
        .cin(out),
        .sum(sum[3:2]),
        .cout(cout)
    );

endmodule