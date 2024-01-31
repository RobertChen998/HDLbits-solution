module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);

reg d;
always @(*) begin
d = L ? r_in : q_in; 

end

always @(posedge clk) begin

Q <= d;

end
endmodule
