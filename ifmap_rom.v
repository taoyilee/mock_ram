module ifmap_rom(clk, addr, oport);
	input clk;
	input [15:0] addr;
	output reg [15:0] oport;
	
	always@(posedge clk)
	begin
		case(addr)
			`include "ifmap_block.v"
			default: oport <= 16'hXXXX;
		endcase
	end
endmodule

