// The testbench for the shifter module
// you can add more test cases
module shifter_tb();
	reg [4:0] sim_in;
	reg [2:0] sim_distance;
	reg sim_direction;
	wire [4:0] sim_out;
	shifter dut(
		.in(sim_in),
		.distance(sim_distance),
		.direction(sim_direction),
		.out(sim_out)
		);
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		// verify that the values shift right
		sim_in = 5'b00101;
		sim_distance = 3'b001;
		sim_direction = 1;
		// wait 10
		#10
		// verify that the values shift left
		sim_in = 5'b00101;
		sim_distance = 3'b111;
		sim_direction = 0;
		// wait 10
		#10
		$finish;
	end
endmodule