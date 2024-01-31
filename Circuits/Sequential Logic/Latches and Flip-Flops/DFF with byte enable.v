module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output reg [15:0] q
);

always @(posedge clk) begin

if(resetn) begin

case(byteena)

2'b11: q<=d;
2'b10: q[15:8] <= d[15:8];
2'b01: q[7:0] <= d[7:0];
default: q<=q;

endcase
end

else begin

q<=0;

end

end

endmodule
