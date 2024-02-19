module top_module (input a, input b, input c, output out);//

    wire out_temp;
    andgate inst1 ( out_temp,a,b,c,1,1 );
    assign out = ~out_temp;

endmodule
