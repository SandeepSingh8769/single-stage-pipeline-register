`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2026 12:05:21
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
/////////////////////////////////////////////////////////////////////////////
module single_stage_pipeline_reg #(parameter DATA_WIDTH = 8)
   (
    input  logic                 clk, // clock
    input  logic                 reset_n,// reset

     input  logic [DATA_WIDTH-1:0] in_data,// Input Data
    input  logic                 in_valid,// Input Valid signal
    output logic                 in_ready,// Input ready signal

     output logic [DATA_WIDTH-1:0] out_data,// Output data
    output logic                  out_valid,//  Output valid data
    input logic                  out_ready//   Read output data
);
 

   logic [DATA_WIDTH-1:0] data_reg;//  Data Register( store the data )
    logic                 valid_reg;// Valid Register( data valid or// not)

    assign in_ready  = ~valid_reg || out_ready;
   
    assign out_data     = data_reg;
    assign out_valid    = valid_reg;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            valid_reg <= 1'b0;
        else if (in_ready)begin
            valid_reg <= in_valid;
            if(in_valid)
               data_reg <= in_data;
         end
    end

endmodule
