module top_module(
    input clk,
    input load,
    input [511:0] data,
    output reg [511:0] q );

    integer i;
    reg [512:-1] q_temp;
    always @(posedge clk) begin
        
        if(load) begin
            q_temp <= {1'b0,data,1'b0};
        end
        else begin

            for (i = 0 ; i<=511 ; i = i+1) begin

                q_temp[i] <= q_temp[i-1] ^ q_temp[i+1];

            end

        end
    end

    always @(*) begin
        q = q_temp [511:0];
    end


endmodule
