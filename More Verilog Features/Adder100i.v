module add_1(

    input a,
    input b,
    input cin,
    output sum,
    output cout
);

assign sum = a^b^cin;
assign cout = a&b | b&cin | cin&a ; 

endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

assign sum[0] = a[0]^b[0]^cin;
assign cout[0] = a[0]&b[0] | b[0]&cin | cin&a[0] ;

genvar i;
generate
    
    for( i = 1 ; i < 100 ; i=i+1 )begin: BLOCK1 // genvar can be in generate or out of. BLOCK1 is a must, otherwise might have error

        add_1 add_1_1(.a(a[i]),.b(b[i]),.cin(cout[i-1]),.sum(sum[i]),.cout(cout[i]));


    end


endgenerate    



endmodule
