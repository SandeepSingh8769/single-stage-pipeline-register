`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 01:51:28
// Design Name: 
// Module Name: single_stage_pipeline_reg
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
module single_stage_pipeline_reg #(parameter DATA_WIDTH = 8)
   (
    input  logic                 clk, // clock 
    input  logic                 reset_n,// reset 

    input  logic [DATA_WIDTH-1:0] input_data,// Actual Data
    input  logic                 input_valid,// Valid Data
    output logic                 input_ready,// Pipline ready to get data 

    output logic [DATA_WIDTH-1:0] out_data,// Stored Data
    output logic                 out_valid,// Valid Output
    input  logic                 out_ready// Next Stage is Ready
);

    logic [DATA_WIDTH-1:0] data_reg;//  Data Register( store the data )
    logic                 valid_reg;// Valid Register( data valid or// not)

    assign input_ready  = !valid_reg || out_ready;
    assign out_data  = data_reg;
    assign out_valid = valid_reg;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            valid_reg <= 1'b0;
        else if (input_ready)
            valid_reg <= input_valid;
    end

    always_ff @(posedge clk) begin
        if (input_ready && input_valid)
            data_reg <= input_data;
    end

endmodule


