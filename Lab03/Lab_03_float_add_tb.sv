// The testbench for the float_add module
// you can add more test cases
module float_add_tb();
	reg [7:0] sim_inA;
	reg [7:0] sim_inB;
	wire [7:0] sim_out;
	float_add dut(
		.aIn(sim_inA),
		.bIn(sim_inB),
		.result(sim_out)
		);
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		// // Checking basic addition . This should verify exponents and 1 maxing
		// sim_inA = 8'b11111110;
		// sim_inB = 8'b11111000;
		// // wait 10
		// #10
		// // Verify that general addition works , exponents don 't get lost , etc
		// sim_inA = 8'b00110001;
		// sim_inB = 8'b00001100;
		// // wait 10
		// #10
		sim_inA = 8'b00001000;
		sim_inB = 8'b00000011;
		// wait 10
		#10
      	sim_inA = 8'b00110001;
		sim_inB = 8'b00001100;
		// wait 10
		#10
     	sim_inA = 8'b11111111;
		sim_inB = 8'b11111111;
		#10
		sim_inA = 8'b10010010;
		sim_inB = 8'b01011111;
		// wait 10
		#10
      	sim_inA = 8'b01011010;
		sim_inB = 8'b00111110;
		// wait 10
		#10
     	sim_inA = 8'b11111111;
		sim_inB = 8'b11111111;
		// wait 10
		$finish;
	end
endmodule