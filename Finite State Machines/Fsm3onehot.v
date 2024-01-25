module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = in ? 0 : state[A] | state[C];
    assign next_state[B] = in ? state[A] | state[B] | state[D] : 0;
    assign next_state[C] = in ? 0 : state[B] | state[D];
    assign next_state[D] = in ? state[C] : 0;

    // Output logic: 
    assign out = state[D];

endmodule
