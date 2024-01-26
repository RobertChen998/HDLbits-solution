module top_module (input x, input y, output z);

wire IA1_z, IB1_z, IA2_z , IB2_z;
wire o_1,o_2;

IA IA1(x,y,IA1_z);
IB IB1(x,y,IB1_z);
IA IA2(x,y,IA2_z);
IB IB2(x,y,IB2_z);

assign o_1 = IA1_z | IB1_z;
assign o_2 = IA2_z & IB2_z;

assign z = o_1 ^ o_2;

endmodule


module IA (input x, input y, output z);


assign  z = (x^y) & x;



endmodule

module IB ( input x, input y, output z );


assign z = ~(x^y);



endmodule



