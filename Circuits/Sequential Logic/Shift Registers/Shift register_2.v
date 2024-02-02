module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //

MUXDFF muxdff1 (KEY[0],KEY[3],SW[3],KEY[1],KEY[2],LEDR[3]);
MUXDFF muxdff2 (KEY[0],LEDR[3],SW[2],KEY[1],KEY[2],LEDR[2]);
MUXDFF muxdff3 (KEY[0],LEDR[2],SW[1],KEY[1],KEY[2],LEDR[1]);
MUXDFF muxdff4 (KEY[0],LEDR[1],SW[0],KEY[1],KEY[2],LEDR[0]);

endmodule
module MUXDFF (
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

