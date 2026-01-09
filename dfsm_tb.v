`timescale 1ns/1ps

module fsm_tb;

    reg clk;
    reg reset;
    reg x;
    wire z;

    
    //  MODULE NAME 
    
    mealy_t uut (        // <- change this line if needed
        .clk(clk),
        .reset(reset),
        .x(x),
        .z(z)
    );

    
    // CLOCK GENERATION
    
    always #5 clk = ~clk;   // 10 ns clock period

    
    // TEST SEQUENCE
    
    initial begin
        $dumpfile("fsm.vcd");
        $dumpvars(0, fsm_tb);

        // Initialize
        clk = 0;
        reset = 1;
        x = 0;

        #10 reset = 0;

        // Input sequence
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;

        #20 $finish;
    end

endmodule
