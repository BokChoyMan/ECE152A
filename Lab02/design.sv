// AND Module
module AND ( input a , input b , output reg c ) ;
always@ ( a or b )
    begin
        c = a & b ;
    end
endmodule

// NOT Module
module NOT ( input a , output reg b ) ;
    always @(a) begin
        b=~a;
    end
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
    output wire sum ,
    output wire cout ) ;

    wire bXc;

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

    wire ab,bc,ac,x;
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

// //4 -bit Adder comprised of cascaded 1 -bit Full Adders
// module four_onebitFullAdder ( input a [3:0] , input b [3:0] , input cin ,
// output reg sum [3:0] , output reg cout ) ;
// // fill out this module using the onebitFullAdder module
// endmodule