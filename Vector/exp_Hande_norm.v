module exp_Handle_norm(
           input      [11-1:0] norm_sum_with_leading1,
           input      [ 5-1:0] signed_exp_diff,
           input               exp_carry,
           input               sign,
           input      [ 6-1:0] max_exp,
           input      [ 5-1:0] Q_frac,
           output reg [16-1:0] MAC_output
       );


wire zero_flag = (norm_sum_with_leading1 == 0) ? 1'b1 : 0;

// final_exp = max_exp + signed_exp_diff + exp_carry - 24 + 15
// wire signed [8-1:0] final_exp = $signed({1'd0, max_exp}) + $signed(signed_exp_diff) + 
//                         $signed({1'b0, exp_carry}) - 5'sd9 - $signed({1'b0, Q_frac});

// Our data =  max_exp + signed_exp_diff + exp_carry
wire signed [8-1:0] final_exp = $signed({1'd0, max_exp}) + $signed(signed_exp_diff) + 
                        $signed({1'b0, exp_carry});
                        
wire need_to_operate_in_subnormal = ( final_exp < 8'sd1 ) ? 1'b1 : 0;

always @(*) begin
    if (zero_flag)
        MAC_output = {sign, 15'd0};
    else begin
        if (need_to_operate_in_subnormal) begin
            case (final_exp)
                 8'sd0: MAC_output = {sign, 5'd0,       norm_sum_with_leading1[10:1]};
                -8'sd1: MAC_output = {sign, 5'd0, 1'd0, norm_sum_with_leading1[10:2]};
                -8'sd2: MAC_output = {sign, 5'd0, 2'd0, norm_sum_with_leading1[10:3]};
                -8'sd3: MAC_output = {sign, 5'd0, 3'd0, norm_sum_with_leading1[10:4]};
                -8'sd4: MAC_output = {sign, 5'd0, 4'd0, norm_sum_with_leading1[10:5]};
                -8'sd5: MAC_output = {sign, 5'd0, 5'd0, norm_sum_with_leading1[10:6]};
                -8'sd6: MAC_output = {sign, 5'd0, 6'd0, norm_sum_with_leading1[10:7]};
                -8'sd7: MAC_output = {sign, 5'd0, 7'd0, norm_sum_with_leading1[10:8]};
                -8'sd8: MAC_output = {sign, 5'd0, 8'd0, norm_sum_with_leading1[10:9]};
                -8'sd9: MAC_output = {sign, 5'd0, 9'd0, norm_sum_with_leading1[10]  };
                default: MAC_output = {sign, 15'd0};
            endcase
        end
        else
            MAC_output = {sign, final_exp[4:0], norm_sum_with_leading1[9:0]};
    end
end


endmodule
