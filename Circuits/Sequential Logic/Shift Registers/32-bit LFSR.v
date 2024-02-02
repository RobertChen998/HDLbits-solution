module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output reg [31:0] q
); 
wire d21,d1,d0;

assign d21 = q[22] ^ q[0];
assign d1 = q[2] ^ q[0];
assign d0 = q[1] ^ q[0];

integer i;

always @(posedge clk) begin

if(reset) q <= 32'h1;
else begin

q[0] <= d0;
q[1] <= d1;
for(i = 2 ; i<=20 ; i=i+1) begin
    q[i] <= q[i+1];
end

q[21] <= d21;

for(i = 22 ; i<=30 ; i=i+1) begin
    q[i] <= q[i+1];
end

q[31] <= q[0];
end


end 

endmodule
