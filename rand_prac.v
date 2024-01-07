module adder(out,in1,in2);

    input in1,in2;
    output out;

    assign out = in1+in2;
    
endmodule

module adder_tree(out1,out0,in1,in2,in3,in4);

    input in1,in2,in3,in4;
    output out1,out0;

    adder add_0 (.out(out0),.in1(in1),.in2(in2));
    adder add_1 (.out(out1),.in1(in3),.in2(in4));

endmodule





