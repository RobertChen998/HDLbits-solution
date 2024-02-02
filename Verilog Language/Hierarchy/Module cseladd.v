module top_module(
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] sum
);
wire co_1 , co_2 , co_3 ;
reg [15:0] s1,s2;
add16 add1(a[15:0] , b[15:0] , 0 , sum[15:0] , co_1 );
add16 add2(a[31:16] , b[31:16] , 1 , s1 , co_2);
add16 add3(a[31:16] , b[31:16] , 0 , s2 , co_3);

always @(*) begin
    
if(co_1 == 1) begin
    sum[31:16] = s1;

end
else begin

    sum[31:16] = s2;

end 

end





endmodule
