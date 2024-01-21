module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0]  q 
);
wire [7:0] q_1_2,q_2_3,q_3_o;



my_dff8 d1(.clk(clk),.d(d),.q(q_1_2));
my_dff8 d2(.clk(clk),.d(q_1_2),.q(q_2_3));
my_dff8 d3(.clk(clk),.d(q_2_3),.q(q_3_o));

always @(*) begin
    
    if(sel==2'b00)
        q = d;
    else if(sel == 2'b01 )
        q = q_1_2;
    else if(sel == 2'b10)
        q = q_2_3;
    else
        q = q_3_o;


end





endmodule
