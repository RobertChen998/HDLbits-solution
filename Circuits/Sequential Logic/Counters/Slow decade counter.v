module top_module (
    input clk,
    input slowena,
    input reset,
    output reg [3:0] q);

always @(posedge clk) begin

if(reset) q <= 0;
else if (q == 4'd9 && slowena) q <= 0;
else if (slowena) q<= q+1;
else q <= q;

end
endmodule
