/*
 * Testbench for Mealy FSM (dfsm_tb)
 * This testbench verifies the functionality of the mealy_t module.
 * It generates a clock, applies reset, and provides a sequence of inputs to test the FSM behavior.
 * The output is dumped to a VCD file for waveform analysis.
 */
`timescale 1ns/1ps

module fsm_tb;

    reg clk;    // Clock signal
    reg reset;  // Reset signal
    reg x;      // Input signal
    wire z;     // Output signal from UUT


    // UNIT UNDER TEST (UUT) INSTANTIATION
    // Change the module name here if testing a different FSM (e.g., mealy_d)

    mealy_t uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .z(z)
    );


    // CLOCK GENERATION
    // Toggle clock every 5 ns, resulting in a 10 ns period (100 MHz)

    always #5 clk = ~clk;


    // TEST SEQUENCE
    // Initialize signals, apply reset, then provide input sequence

    initial begin
        // Dump waveforms to VCD file for analysis
        $dumpfile("fsm.vcd");
        $dumpvars(0, fsm_tb);

        // Initialize signals
        clk = 0;
        reset = 1;  // Assert reset
        x = 0;

        #10 reset = 0;  // Deassert reset after 10 ns

        // Apply input sequence: 1, 0, 1, 1, 0, 1
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;

        #20 $finish;  // End simulation after additional 20 ns
    end

endmodule
