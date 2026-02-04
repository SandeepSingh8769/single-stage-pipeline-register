`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 02:15:17
// Design Name: 
// Module Name: tb_single_stage_pipeline_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_single_stage_pipeline_reg;

    parameter DATA_WIDTH = 8;

    logic clk;
    logic reset_n;

    logic [DATA_WIDTH-1:0] input_data;
    logic input_valid;
    logic input_ready;

    logic [DATA_WIDTH-1:0] out_data;
    logic out_valid;
    logic out_ready;

    single_stage_pipeline_reg #(.DATA_WIDTH(DATA_WIDTH)) 
         dut(
        .clk(clk),
        .reset_n(reset_n),
        .input_data(input_data),
        .input_valid(input_valid),
        .input_ready(input_ready),
        .out_data(out_data),
        .out_valid(out_valid),
        .out_ready(out_ready)
         );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset_n = 0;
        input_data = 0;
        input_valid = 0;
        out_ready = 0;

        // CASE 1 : Reset active
        #20;
        reset_n = 1;

        // CASE 2 : Valid data & NextStage ready
        @(posedge clk);
        input_data  = 8'b00010101;
        input_valid = 1;
        out_ready   = 1;

        // CASE 3 : Back-to-back valid data
        @(posedge clk);
        input_data  = 8'b00111100;
        input_valid = 1;

        // CASE 4 : No valid input
        @(posedge clk);
        input_valid = 0;

        // CASE 5 : nextstage not ready (stall)
        @(posedge clk);
        out_ready = 0;

        // CASE 6 : Nextstage ready again
        @(posedge clk);
        out_ready = 1;

        #50;
        $finish;
    end

endmodule
