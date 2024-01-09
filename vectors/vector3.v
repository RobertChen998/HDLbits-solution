module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    wire [31:0] concatenate;
    assign concatenate = {a,b,c,d,e,f,2'b11};
    assign z = concatenate [7:0];
    assign y = concatenate [15:8];
    assign x = concatenate [23:16];
    assign w = concatenate [31:24];

endmodule
