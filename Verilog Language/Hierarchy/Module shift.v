module top_module ( input clk, input d, output q );
wire q_1_2,q_2_3;
    my_dff d1 (.clk(clk),.d(d),.q(q_1_2));
    my_dff d2 (.clk(clk),.d(q_1_2),.q(q_2_3));
    my_dff d3 (.clk(clk),.d(q_2_3),.q(q));
    
endmodule
