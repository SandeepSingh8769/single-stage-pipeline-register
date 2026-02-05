`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 12:07:15
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

    logic [DATA_WIDTH-1:0] in_data;
    logic in_valid;
    logic in_ready;

    logic [DATA_WIDTH-1:0] out_data;
    logic out_valid;
    logic out_ready;

    single_stage_pipeline_reg #(.DATA_WIDTH(DATA_WIDTH))
         dut_inst(
        .clk(clk),
        .reset_n(reset_n),
        .in_data(in_data),
        .in_valid(in_valid),
        .in_ready(in_ready),
        .out_data(out_data),
        .out_valid(out_valid),
        .out_ready(out_ready)
         );

    always #5 clk = ~clk;

    initial begin
        // Reset
        clk = 0;
        reset_n = 0;
        in_data = 0;
        in_valid = 0;

        //Reset de-assereted
        #20;
        reset_n = 1;
     
        //Input valid data
        @(posedge clk);
        in_data  = 8'b00010101;
        in_valid = 1;
        out_ready   = 1;

        //Input valid data
        @(posedge clk);
        in_data  = 8'b00111100;
        in_valid = 1;

        //No valid input
        @(posedge clk);
        in_valid = 0;
        in_data  = 8'b10111000;
     
        //No Read with valid input data
        @(posedge clk);
        out_ready = 0;
        in_valid = 1;
        in_data  = 8'b10111000;
       
        //Read only No valid input
        @(posedge clk);
        out_ready = 1;
        in_valid = 0;
        in_data  = 8'b10101000;
     
        //Read data
        @(posedge clk);
        out_ready = 1;

        #50;
        $finish;
    end

endmodule

