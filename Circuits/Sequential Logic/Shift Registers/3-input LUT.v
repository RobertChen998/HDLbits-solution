module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output reg Z ); 

    reg [0:7] q;

    always @(*) begin 

        case({A,B,C})

            3'b000: Z = q[0];
            3'b001: Z = q[1];
            3'b010: Z = q[2];
            3'b011: Z = q[3];
            3'b100: Z = q[4];
            3'b101: Z = q[5];
            3'b110: Z = q[6];
            default: Z = q[7];
        endcase
    end

    always @(posedge clk) begin

        if(enable) begin

            q[0] <= S;
            q[1] <= q[0];
            q[2] <= q[1];
            q[3] <= q[2];
            q[4] <= q[3];
            q[5] <= q[4];
            q[6] <= q[5];
            q[7]    <= q[6];

        end
        else begin
            q[0] <= q[0];
            q[1] <= q[1];
            q[2] <= q[2];
            q[3] <= q[3];
            q[4] <= q[4];
            q[5] <= q[5];
            q[6] <= q[6];
            q[7] <= q[7];


        end
    end
endmodule
