module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output reg [4:0] q
); 
wire d3;
assign d3 = q[3] ^ q[0];

always @(posedge clk) begin

    if(reset) q<=5'b1;
    else begin

        q[0] <= q[1];
        q[1] <= q[2];
        q[2] <= d3;
        q[3] <= q[4];
        q[4] <= q[0];
    end

end
endmodule
