module mealy_d (
    input clk,
    input reset,
    input x,
    output reg z
);
    reg q;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= q ^ x;
    end

    always @(*) begin
        z = q ^ x;
    end
endmodule
