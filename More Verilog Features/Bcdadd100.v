module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire[399:0]co;
    genvar i;
    bcd_fadd bcd1(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(co[3]),.sum(sum[3:0]));
    generate
        for(i = 4;i<=396;i=i+4) begin: BLOCK1

            bcd_fadd bcd1_1(.a(a[i+3:i]),.b(b[i+3:i]),.cin(co[i-1]),.cout(co[i+3]),.sum(sum[i+3:i]));

        end
    assign cout = co[399];


    endgenerate







endmodule
