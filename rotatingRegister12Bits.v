`timescale 1ns/1ns

// rotates bits out one at a time
module rotatingRegister12Bits(ParallelLoadn, clock, reset, Enable, DATA_IN, Q);
									  
	input ParallelLoadn, clock, reset, Enable;
	input[11:0] DATA_IN;
	output reg[11:0] Q;
	
	always @(posedge clock, negedge reset, negedge ParallelLoadn)
		begin
			if (!reset)
				Q <= 0;
			else if (!ParallelLoadn)
				Q <= DATA_IN;
			else if (Enable)
				Q <= {1'b0, Q[11:1]};
		end
endmodule