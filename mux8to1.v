`timescale 1ns/1ns

module mux8to1(input[11:0] A, B, C, D, E, F, G, H, input[2:0] MuxSelect, output reg[11:0] Out);

	always @(*) // Declare always block
	begin
		case (MuxSelect) // start case statement
			3'b000: Out = A;
			3'b001: Out = B;
			3'b010: Out = C;
			3'b011: Out = D;
			3'b100: Out = E;
			3'b101: Out = F;
			3'b110: Out = G;
			3'b111: Out = H;
			default: Out = 12'bxxxxxxxxxxxx;
		endcase
	end
	
endmodule
	