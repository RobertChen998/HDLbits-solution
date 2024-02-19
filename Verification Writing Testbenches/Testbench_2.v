module top_module();

reg clk;
reg in;
reg [2:0] s;
wire out;
initial begin
    clk = 0;
    forever begin
        #5
        clk = ~clk;
    end

end

initial begin
    in = 0;
    s = 2;
    #10
    in = 0;
    s = 6;
    #10
    in = 1;
    s = 2;
    #10
    in = 0;
    s = 7;
    #10
    in = 1;
    s = 0;
    #30
    in = 0;
    s = 0;
    
end

q7 DUT (clk,in,s,out);




endmodule
