/*
 * Mealy Machine Design (mealy_t)
 * This is another Mealy machine. Like mealy_d, the output depends on the internal state and the input.
 * The state flips (changes from 0 to 1 or 1 to 0) only when the input x is 1; if x is 0, the state stays put, unless reset.
 * The output is a mix (XOR) of the current state and the input, calculated instantly.
 * XOR means exclusive or: 1 if bits differ, 0 if same.
 */
module mealy_t (
    input clk,      // Clock - the timing signal that drives the machine
    input reset,    // Reset - use this to reset the state to 0 and start over
    input x,        // Input x - the bit we send to the machine
    output reg z    // Output z - the bit the machine sends back
);
    reg q;  // Internal state - keeps track of things, resets to 0

    // State update logic: Changes the state on clock ticks or reset
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;  // Reset: set state to 0
        else if (x)
            q <= ~q;     // If input x is 1, flip the state (0 becomes 1, 1 becomes 0)
        // If x is 0, state stays the same
    end

    // Output calculation: Computes the output right away
    always @(*) begin
        z = q ^ x;  // Output z is state XOR input x
    end
endmodule
