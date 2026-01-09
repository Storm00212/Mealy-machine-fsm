/*
 * Testbench for Mealy Machine (dfsm_tb)
 * This testbench checks how the mealy_t machine works. It creates a clock, resets the machine, and feeds it a series of inputs to see what outputs come out.
 * The results are saved in a VCD file so we can look at the waveforms and understand the behavior.
 */
`timescale 1ns/1ps

module fsm_tb;

    reg clk;    // Clock - the timing pulse
    reg reset;  // Reset - to clear the machine
    reg x;      // Input x - what we send to the machine
    wire z;     // Output z - what the machine sends back


    // Setting up the unit under test (the mealy_t machine we're testing)
    // If you want to test a different machine, like mealy_d, change the name here

    mealy_d uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .z(z)
    );


    // Creating the clock
    // The clock flips every 5 nanoseconds, so a full cycle (high then low) takes 10 nanoseconds

    always #5 clk = ~clk;


    // Running the test
    // We start by setting up, resetting, then sending inputs one by one

    initial begin
        // Save the signals to a file for later viewing
        $dumpfile("fsm.vcd");
        $dumpvars(0, fsm_tb);

        // Get everything ready
        clk = 0;      // Clock starts low
        reset = 1;    // Turn on reset to clear the machine
        x = 0;        // Input starts at 0

        #10 reset = 0;  // After 10 nanoseconds, turn off reset

        // Now send a sequence of inputs: 1, then 0, then 1, 1, 0, 1
        // Each input lasts 10 nanoseconds (one clock cycle)
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;

        #20 $finish;  // Wait a bit more and stop the simulation
    end

endmodule
