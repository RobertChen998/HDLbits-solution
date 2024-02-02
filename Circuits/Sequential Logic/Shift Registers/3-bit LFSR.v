module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output reg [2:0] LEDR);  // Q

wire [2:0] D;

assign D[0] = KEY[1] ? SW[0] : LEDR[2];
assign D[1] = KEY[1] ? SW[1] : LEDR[0];
assign D[2] = KEY[1] ? SW[2] : LEDR[1] ^ LEDR[2];

always @(posedge KEY[0]) begin

LEDR<=D;

end
endmodule
