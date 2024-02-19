module top_module ( );
reg clk;

dut clk_1 (
    .clk(clk)
);

initial begin
    clk = 0;
    forever begin
    #5
    clk = ~clk;
end

end


endmodule
