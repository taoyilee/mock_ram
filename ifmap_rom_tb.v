`define CYCLE      30
`define END 16

module ifmap_rom_tb;
	initial begin
		$fsdbDumpfile("ifmap_rom");
		$fsdbDumpvars;
	end	

	reg clk = 0;
	always begin #(`CYCLE/2) clk = ~clk; end
	reg [15:0] addr;
	wire [15:0] oport;
	integer i;

	ifmap_rom I0( .clk(clk), .addr(addr), .oport(oport));

	initial begin 
	 	$display("** Simulation begin .....");
		addr <= 0;

		for(i = 0 ; i < `END ; i = i + 1)
		begin
			@(negedge clk) addr <= addr + 1;
		end
	 	$display("** Simulation end .....");
		$finish;
	end

endmodule
