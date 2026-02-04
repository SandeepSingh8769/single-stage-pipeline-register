# Single Stage Pipeline Register (Valid–Ready Handshake)

This project implements a **single-stage pipeline register** in **SystemVerilog** using a standard **valid/ready handshake protocol**.

## Features
- Parameterized data width (default: 8-bit)
- Fully synthesizable RTL
- Supports backpressure (no data loss or duplication)
- Clean reset to empty state
- Simple and readable design

## Interface Description
- `input_valid` / `input_ready` : Upstream handshake
- `out_valid` / `out_ready`     : Downstream handshake

Data is accepted only when both `input_valid` and `input_ready` are high.

## Files
- `single_stage_pipeline_reg.sv` : RTL design
- `tb_single_stage_pipeline_reg.sv` : Testbench

## Simulation
Simulated using **Xilinx Vivado Simulator**.  
Waveforms verify correct data transfer and backpressure handling.
## Simulation Output

![Simulation Waveform]

## Author
Sandeep Singh
