module top_module ();

reg clk;
reg reset;
reg t;
wire q;

tff DUT (clk,reset,t,q);

initial begin

    clk = 0;
    forever begin
        #5
        clk = ~clk;
    end

end

initial begin

    reset = 0;
    t = 0;
    #3
    reset = 1;
    #10
    reset = 0;
    t = 1;

end


endmodule
