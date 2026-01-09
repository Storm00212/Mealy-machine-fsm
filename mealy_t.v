/*
 * Mealy Machine Design (mealy_t)
 * This module implements a Mealy finite state machine.
 * The output 'z' depends on both the current state 'q' and the input 'x'.
 * State update: q toggles (flips) when x=1, stays the same when x=0 (unless reset).
 * Output: z = q XOR x, computed combinatorially.
 */
module mealy_t (
    input clk,      // Clock signal
    input reset,    // Asynchronous reset signal
    input x,        // Input bit
    output reg z    // Output bit (registered for synthesis, but computed in always @*)
);
    reg q;  // State register, initialized to 0 on reset

    // Sequential logic: Update state on clock edge or reset
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;  // Reset state to 0
        else if (x)
            q <= ~q;     // Toggle state when input x is 1
    end

    // Combinational logic: Compute output based on current state and input
    always @(*) begin
        z = q ^ x;  // Output z is XOR of state q and input x
    end
endmodule
