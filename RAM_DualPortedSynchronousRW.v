module ram_dp_sr_sw(clock, // clock signal
	we, // write enable
	pa, // primary address
	sa, // secondary address
	di, // data input
	pdo, // primary output
	sdo  // secondary output
	);
	// parameters
	parameter DATA_WIDTH = 8;
	parameter ADDR_WIDTH = 8;
	parameter RAM_DEPTH = 1 << ADDR_WIDTH;
	
	// pin/port definition
	input clock;
	input we;
	input  [ADDR_WIDTH - 1:0] pa;
	input  [ADDR_WIDTH - 1:0] sa;
	input  [DATA_WIDTH - 1:0] di;
	output [DATA_WIDTH - 1:0] pdo;
	output [DATA_WIDTH - 1:0] sdo;
	reg    [DATA_WIDTH - 1:0] DPRAM [RAM_DEPTH - 1:0];
	reg    [ADDR_WIDTH - 1:0] current_pa;
	reg    [ADDR_WIDTH - 1 :0] current_sa;

	// evaluation
	always @(posedge clock)
		// execution
		begin
			// event
	    		if(we)
		    		DPRAM[pa] = di;
	    		current_pa = pa;
		    	current_sa = sa;
		end

	// assignment
	assign pdo = DPRAM[current_pa];
	assign sdo = DPRAM[current_sa];
endmodule