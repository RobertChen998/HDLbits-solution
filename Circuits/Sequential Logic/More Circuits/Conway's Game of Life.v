module top_module(
    input clk,
    input load,
    input [255:0] data,
    output reg [255:0] q ); 
    
    reg [271:-16] q_temp;

    integer i;
    reg [3:0] count;

    always @(*) begin

        q_temp = {q[15:0],q,q[255:240]};
    end

    always @(posedge clk) begin
        if(load) begin

            q <= data;

        end
        else begin
            for(i = 0 ; i <= 255 ; i = i+1) begin
                if(i == 0) count = q_temp[255] + q_temp[240] + q_temp[241] + q_temp[15] + q_temp[1] + q_temp[31] + q_temp[16] + q_temp[17];
                else if(i==15) count = q_temp[254] + q_temp[255] + q_temp[240] + q_temp[14] + q_temp[0] + q_temp[30] + q_temp[31] + q_temp[16];
                else if(i==240) count = q_temp[239] + q_temp[224] + q_temp[225] + q_temp[255] + q_temp[241] + q_temp[15] + q_temp[0] + q_temp[1];
                else if(i==255) count = q_temp[238] + q_temp[239] + q_temp[224] + q_temp[254] + q_temp[240] + q_temp[14] + q_temp[15] + q_temp[0];
                else if(i == 16 || i == 32 || i == 48 || i == 64 || i == 80 || i == 96 || i==112 || i==128 || i == 144
                   || i == 160 || i == 176 || i == 192 || i == 208 || i == 224 ) begin

                        count = q_temp[i-1] + q_temp[i-16] + q_temp[i-15] + q_temp[i+15] + q_temp[i+1] + q_temp[i+31] + q_temp[i+16] + q_temp[i+17];

                   end
                else if(i == 31 || i == 47 || i == 63 || i == 79 || i == 95 || i==111 || i==127 || i == 143
                   || i == 159 || i == 175 || i == 191 || i == 207 || i == 223 || i == 239) begin
                        count = q_temp[i-17]+q_temp[i-16]+q_temp[i-31]+q_temp[i-1]+q_temp[i-15]+q_temp[i+15]+q_temp[i+16]+q_temp[i+1];

                end
                else count = q_temp[i-17] + q_temp[i-16] + q_temp[i-15] + q_temp[i-1] + q_temp[i+1] + q_temp[i+15] + q_temp[i+16] + q_temp[i+17];
            
            
                if(count == 4'd2)
                    q[i] <= q_temp[i];
                else if(count == 4'd3)
                    q[i] <= 1'b1;
                else
                    q[i] <= 1'b0;
            

        end

    end
    end

endmodule