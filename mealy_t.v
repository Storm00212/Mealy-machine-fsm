module mealy_t (
    input clk,
    input reset,
    input x,
    output reg z
);
    reg q;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else if (x)
            q <= ~q;
    end

    always @(*) begin
        z = q ^ x;
    end
endmodule
