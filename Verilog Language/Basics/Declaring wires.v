`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire an1_o,an2_o;
    
    assign an1_o = a & b;
    assign an2_o = c & d;
    assign out = an1_o | an2_o;
    assign out_n = !out;

endmodule
