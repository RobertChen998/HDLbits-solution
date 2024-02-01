module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);

    wire [2:0] enable;

    assign enable = {ena & mm==8'h59 & ss==8'h59,ena & ss==8'h59,ena};
    count_ss s(clk,reset,enable[0],ss);
    count_mm m(clk,reset,enable[1],mm);
    count_hh h(clk,reset,enable[2],pm,hh);

endmodule

module count_ss (
    input clk,
    input reset,
    input ena,
    output reg [7:0] ss
);

always @(posedge clk) begin
if(reset) ss <= 0;
else if (ena & ss == 8'h59) ss <= 8'h0;
else if (ena & ss[3:0]==4'd9) begin
ss[3:0] <= 0;
ss[7:4] <= ss[7:4] + 1;
end
else if (ena) ss <= ss+1; 
else   ss <= ss;

end
endmodule

module count_mm (
    input clk,
    input reset,
    input ena,
    output reg [7:0] mm
);

always @(posedge clk) begin
if(reset) mm <= 0;
else if (ena & mm == 8'h59) mm <= 8'h0;
else if (ena & mm[3:0]==4'd9) begin
mm[3:0] <= 0;
mm[7:4] <= mm[7:4] + 1;
end
else if (ena) mm <= mm+1; 
else   mm <= mm;

end
endmodule

module count_hh (
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh
);

always @(posedge clk) begin
if(reset) begin
    hh <= 8'h12;
    pm <= 0;
end
else if (hh == 8'h12 & ena) begin 
hh <= 1;
end
else if (ena & hh[3:0] == 4'h9) begin
    hh[3:0] <= 4'h0;
    hh[7:4] <= 4'h1;
end
else if(ena) hh <= hh + 1;
else   hh <= hh;

if(hh == 8'h11 & ena) pm <= ~pm;
else pm <= pm;
end
endmodule