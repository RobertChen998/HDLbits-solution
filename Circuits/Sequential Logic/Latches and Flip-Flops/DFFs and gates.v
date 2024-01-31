module top_module (
    input clk,
    input x,
    output z
); 

reg Q1,Q2,Q3;
reg D1,D2,D3;

always @(*) begin

D1 = x ^ Q1;
D2 = x & (~Q2);
D3 = x | (~Q3);


end

always @(posedge clk) begin

Q1 <= D1;
Q2 <= D2;
Q3 <= D3;

end

assign z = ~(Q1|Q2|Q3);

endmodule
