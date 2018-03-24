`timescale 1ns/1ns

module morseCodeDisplay(letterSelect, ParallelLoadn, Reset, Clock, simReset, morseBit);

	input[2:0] letterSelect;
	input ParallelLoadn, Reset, Clock, simReset;
	output morseBit;
	
	// Codes for letters are backwards because they are rotated to the right
	wire[11:0] letterToDisplay;
	mux8to1 M0(.A(12'b000000111010), .B(12'b001010101110), .C(12'b101110101110), .D(12'b000010101110),
				  .E(12'b000000000010), .F(12'b001011101010), .G(12'b001011101110), .H(12'b000010101010),
				  .MuxSelect(letterSelect), .Out(letterToDisplay));
			
	wire[31:0] RDOut;
	RateDivider RD0(.countDownNum(24_999_999), .clock(Clock), .simReset(simReset), .RDOut(RDOut));
	wire Enable;
	assign Enable = (RDOut == 32'b00000000000000000000000000000000) ? 1 : 0;
	
	wire[11:0] Q;
	rotatingRegister12Bits RR0(.ParallelLoadn(ParallelLoadn), .clock(Clock), .reset(Reset), .Enable(Enable),
										.DATA_IN(letterToDisplay), .Q(Q));
	assign morseBit = Q[0];
										
endmodule
				  
	