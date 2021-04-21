// this goes in your design .sv
// you can add more modules if you want
//5-bit Adder without Cin
module adder(
	input [4:0] a,
	input [4:0] b,
	output reg [4:0] sum,
	output reg cout
	);
	// fill out this module
endmodule

// Outputs the number with bigger exponent as aout and smaller as bout
module big_number_first(
	input [7:0] aIn,
	input [7:0] bIn,
	output reg [7:0] aOut,
	output reg [7:0] bOut
	);
	// fill out this module
endmodule

// The bits of in shifted by distance to the left ( direction =0) or to the right ( direction =1)	
module shifter(
	input [4:0] in,
	input [2:0] distance,
	input direction,
	output reg [4:0] out
	);
	// fill out this module
endmodule

// Highest module in the hierarchy
module float_add(
	input [7:0] aIn,
	input [7:0] bIn,
	output reg [7:0] result
	);
	// fill out this module
endmodule