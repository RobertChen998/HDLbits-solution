module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);


assign ena = {q[11:8]==4'd9 && q[7:4]==4'd9 && q[3:0] == 4'd9 , q[7:4]==4'd9 && q[3:0] == 4'd9 , q[3:0] == 4'd9 };

counter a  (clk,reset,1'b1, q[3:0]);
counter b  (clk,reset,ena[1], q[7:4]);
counter c  (clk,reset,ena[2], q[11:8]);
counter d  (clk,reset,ena[3], q[15:12]);


endmodule

module counter(
    input clk,
    input reset,
    input ena,
    output reg [3:0] q

);

always @(posedge clk) begin

if(reset) q <= 0;
else if (ena && q == 4'd9) q <= 0;
else if (ena) q <= q+1;
else q<=q;

end



endmodule
