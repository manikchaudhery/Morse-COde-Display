`timescale 1ns/1ns

module RateDivider(countDownNum, clock, simReset, RDOut);

	input[31:0] countDownNum;
	input clock, simReset;
	output reg[31:0] RDOut;
	
	always @ (posedge clock)
		begin
			if (simReset)
				RDOut <= 0;
			else if (RDOut == 0)
				RDOut <= countDownNum;
			else
				RDOut <= RDOut - 1;
		end

endmodule