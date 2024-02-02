module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);


wire co_1,co_2;

add16 ADD1(a[15:0],b[15:0],0,sum[15:0],co_1);

add16 ADD2(a[31:16],b[31:16],co_1,sum[31:16],co_2);



endmodule

