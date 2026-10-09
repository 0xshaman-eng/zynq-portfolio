`timescale 1ns / 1ps
module blink (
    input  wire clk,     // 50 MHz from FCLK_CLK0
    input  wire rst_n,   // FCLK_RESET0_N (active-low)
    output reg  led
);
    reg [24:0] count;
    always @(posedge clk) begin
        if (!rst_n) begin
            count <= 0;
            led   <= 0;
        end else if (count == 25'd24_999_999) begin
            count <= 0;
            led   <= ~led;
        end else begin
            count <= count + 1;
        end
    end
endmodule