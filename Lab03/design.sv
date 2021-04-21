//5 -bit Adder without Cin
module adder (
input [4:0] a ,
input [4:0] b ,
output [4:0] sum ,
output cout);
    wire [5:0] s;
    assign s = a+b;
    assign sum = s[4:0];
    assign cout = s[5];

endmodule

//3 -bit subtractor 
module subtractor (
input [2:0] a ,
input [2:0] b ,
output [2:0] difference
);
   assign difference = a-b;
endmodule

// Outputs the number with bigger exponent as aout and smaller as bout
module big_number_first (
input [7:0] aIn,
input [7:0] bIn,
output [7:0] aOut,
output [7:0] bOut
) ;
    assign aOut = (aIn[7:5] > bIn[7:5]) ? aIn : bIn;
    assign bOut = (aIn[7:5] > bIn[7:5]) ? bIn : aIn;

endmodule
// The bits of in shifted by distance to the left ( direction =0) or to 
//the right ( direction =1)
module shifter (
input [4:0] in,
input [2:0] distance ,
input direction,
output reg [4:0] out
);

always @(in or direction or distance) begin
    if (direction == 1) begin
        out = in >> distance;
    end else
        out = in << distance;
end
 
endmodule
// Highest module in the hierarchy
module float_add (
input [7:0] aIn ,
input [7:0] bIn ,
output reg [7:0] result
);

reg [7:0] l,s;
reg [2:0] d;
reg [4:0] m,n,sum;
wire cout;
big_number_first b0 (
    .aIn(aIn),
    .bIn(bIn),
    .aOut(l),
    .bOut(s)
);

subtractor sub0 (
    .a(l[7:5]),
    .b(s[7:5]),
    .difference(d)
);

shifter shift0 (
    .in(s[4:0]),
    .distance(d),
    .direction(1'b1),
    .out(m)
);

adder a0 (
    .a(m),
    .b(l[4:0]),
    .sum(sum),
    .cout(cout)
);

wire [4:0] mantissa;
wire [3:0] exponent;
assign mantissa = cout ? {cout , sum[4:1]} : sum;

assign exponent = cout + l[7:5] ;

assign result = exponent[3] ? 8'b11111111 : {exponent,mantissa};

endmodule