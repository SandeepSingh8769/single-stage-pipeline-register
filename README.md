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
![Simulation Waveform](waveform.png)
<img width="2000" height="869" alt="image" src="https://github.com/user-attachments/assets/14bba70c-abce-48a8-b34a-cfab757317fd" />
## RTL ANALYSIS
![Simulation RTL ANALYSIS](rtlnalysis.png)
<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/eb24ae0a-3b64-4553-9ede-fb649ebecfc7" />
## Technology Schematic
![Simulation Technology Schematic](Technology Schematic.png)
<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/0cd68661-83ab-4e08-b8fe-f620ed6723e1" />
## Implemented Design (Placed & Routed Circuit)
![SimulationImplemented Design (Placed & Routed Circuit)](Implemented Design(Placed & Routed Circuit).png)
<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/2ac0c80f-5434-432a-95fe-853dc3df0806" />
<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/4a3341f6-0403-49b5-a610-db3ae8951816" />
## POWER SUPPLY
![Simulation POWER SUPPLY](powersupply.png)
<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/5fa5ceed-563f-4c91-841d-94026c1b1577" />

## Author
Sandeep Singh
