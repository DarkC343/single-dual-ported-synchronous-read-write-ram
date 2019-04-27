module ram_sp_sr_sw(clock, // clock signal
	we, // write enable
	a, // address
	di, // data input
	do, // primary output
	);
	// parameters
	parameter DATA_WIDTH = 8;
	parameter ADDR_WIDTH = 8;
	parameter RAM_DEPTH = 1 << ADDR_WIDTH;
	
	// pin/port definition
	input clock;
	input we;
	input  [ADDR_WIDTH - 1:0] a;
	input  [DATA_WIDTH - 1:0] di;
	output [DATA_WIDTH - 1:0] do;
	reg    [DATA_WIDTH - 1:0] SPRAM [RAM_DEPTH - 1:0];
	reg    [ADDR_WIDTH - 1:0] current_a;

	// evaluation
	always @(posedge clock)
		// execution
		begin
			// event
	    		if(we)
		    		SPRAM[a] = di;
	    		current_a = a;
		end

	// assignment
	assign do = SPRAM[current_a];
endmodule