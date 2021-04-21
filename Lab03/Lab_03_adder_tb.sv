// The testbench for the adder module
// you can add more test cases
module adder_tb();
	reg [4:0] sim_A;
	reg [4:0] sim_B;
	wire [4:0] sim_sum;
	wire sim_cout;
	adder dut(
		.a(sim_A),
		.b(sim_B),
		.sum(sim_sum),
		.cout(sim_cout)
		);
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		// both 0
		sim_A = 5'b0;
		sim_B = 5'b0;
		// wait 10
		#10
		// checking overflow and basic addition
		sim_A = 5'b11100;
		sim_B = 5'b11010;
		// wait 10
		#10
		// making sure values actually add
		sim_A = 5'b00001;
		sim_B = 5'b00011;
		// wait 10
		#10
		$finish;
	end
endmodule