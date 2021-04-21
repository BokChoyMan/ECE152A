`include "design.sv"
// The testbench for the big_number_first module
// you can add more test cases
module big_number_first_tb();
	reg [7:0] sim_A;
	reg [7:0] sim_B;
	wire [7:0] sim_aOut;
	wire [7:0] sim_bOut;
	big_number_first dut(
		.aIn(sim_A),
		.bIn(sim_B),
		.aOut(sim_aOut),
		.bOut(sim_bOut)
		);
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		// both 0
		sim_A = 8'b0;
		sim_B = 8'b0;
		// wait 10
		#10;
		// Picking the simB as the larger value
		sim_A = 8'b00011100;
		sim_B = 8'b11111010;
		// wait 10
		#10;
		// Picking the first one as the larger value
		sim_A = 8'b11111100;
		sim_B = 8'b00011100;
		// wait 10
		#10;
		$finish;
	end
endmodule