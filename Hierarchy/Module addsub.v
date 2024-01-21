module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
wire co_1,co_2;
wire [31:0] b_f;
add16 ADD1 (a[15:0],b_f[15:0],sub,sum[15:0],co_1);
add16 ADD2 (a[31:16],b_f[31:16],co_1,sum[31:16],co_2);

assign b_f = b ^ {32{sub}};


endmodule

