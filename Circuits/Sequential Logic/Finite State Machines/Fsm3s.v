module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    parameter A = 2'b00 , B = 2'b01 , C = 2'b10 , D = 2'b11;
    reg [1:0] state , next_state;
    always @(*) begin
        
        case (state)

            A: next_state = in ? B : A;
            B: next_state = in ? B : C;
            C: next_state = in ? D : A;
            D: next_state = in ? B : C;


        endcase


    end

    always @(posedge clk) begin

        if(reset) begin
            state <= A;

        end
        else begin

            state <= next_state;
        end

    end
    assign out = (state == D);
    // State transition logic

    // State flip-flops with synchronous reset

    // Output logic

endmodule
