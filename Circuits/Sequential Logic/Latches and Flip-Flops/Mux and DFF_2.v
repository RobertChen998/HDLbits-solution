module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);

reg a,d;

always @(*) begin

a = E ? w:Q;
d = L ? R:a;

end

always @(posedge clk) begin

Q<=d;

end


endmodule
