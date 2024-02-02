module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output reg out);

reg [3:1] D;

always @(posedge clk) begin

    if(!resetn) begin
        out <= 0;
        D[3:1] <= 3'b0;
    end
    else begin
        D[1] <= in;
        D[2] <= D[1];
        D[3] <= D[2];
        out <= D[3];

    end
end
endmodule
