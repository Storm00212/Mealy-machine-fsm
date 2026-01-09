/*
 * Mealy Machine Design (mealy_d)
 * This is a simple Mealy machine. In a Mealy machine, the output depends on both the current internal state and the input.
 * Here, the machine's state changes by mixing (XOR) with the input on every clock tick, unless we hit reset to start over.
 * The output is also a mix (XOR) of the current state and the input, calculated right away.
 * XOR means exclusive or: it's 1 if the bits are different, 0 if the same.
 */
module mealy_d (
    input clk,      // Clock - the timing signal that makes things happen
    input reset,    // Reset - press this to clear the state and start fresh
    input x,        // Input x - the bit we feed into the machine
    output reg z    // Output z - the bit the machine produces
);
    reg q;  // Internal state - remembers what's happening, starts at 0 when reset

    // State update logic: Changes the internal state based on clock and reset
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;  // When reset is active, set state back to 0
        else
            q <= q ^ x;  // Otherwise, update state to state XOR input x (mix them together)
    end

    // Output calculation: Figures out what to output based on current state and input
    always @(*) begin
        z = q ^ x;  // Output z is state XOR input x (another mix)
    end
endmodule
