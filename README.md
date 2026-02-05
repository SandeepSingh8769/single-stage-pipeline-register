# Single Stage Pipeline Register (Valid–Ready Handshake)
   ## single_stage_pipeline circuit
   <img width="1536" height="1024" alt="single_stage_pipeline" src="https://github.com/user-attachments/assets/71db36b7-6b4d-42f0-ae70-d5e24df54698" />

## 📌 Project Overview
This project implements a single-stage pipeline register in SystemVerilog using a standard valid–ready handshake protocol.
The design safely transfers data between two pipeline stages while handling backpressure, stalling, and data integrity.

This project implements a **single-stage pipeline register** in **SystemVerilog** using a standard **valid/ready handshake protocol**.
## 🎯 Design Objective

Store one data word (parameterized width),
Accept input data only when both sides are ready,
Hold data during downstream stall,
Avoid data loss or duplication,
Fully synthesizable and reset-safe

## Features
- Parameterized data width (default: 8-bit)
- Fully synthesizable RTL
- Supports backpressure (no data loss or duplication)
- Clean reset to empty state
- Simple and readable design

## Interface Description
- `input_valid` / `input_ready` : Upstream handshake
- `out_valid` / `out_ready`     : Downstream handshake
## Inputs

clk – System clock

reset_n – Active-low reset

input_data [DATA_WIDTH-1:0] – Input data

input_valid – Indicates valid input data

out_ready – Downstream ready signal

## Outputs

input_ready – Pipeline ready to accept data

out_data [DATA_WIDTH-1:0] – Stored output data

out_valid – Indicates valid output data
Data is accepted only when both `input_valid` and `input_ready` are high.

## Files
- `single_stage_pipeline_reg.sv` : RTL design
- `tb_single_stage_pipeline_reg.sv` : Testbench
  ## ⚙️ Internal Logic Explanation

The design uses two internal registers:

data_reg → stores actual data

valid_reg → tracks whether stored data is valid

assign input_ready = !valid_reg || out_ready;

## Logic meaning:

If register is empty → ready to accept new data

If register is full but downstream is ready → allow transfer

If downstream is not ready → stall and hold data
## 🔄 Working of Valid–Ready Handshake
## Case 1: Normal data transfer

input_valid = 1

input_ready = 1

Data is captured on clock edge

out_valid becomes 1

## Case 2: Downstream stall (Backpressure)

out_ready = 0

input_ready = 0

Data is held safely in register

No overwrite occurs

## Case 3: Resume after stall

out_ready = 1

Data is released

New input can be accepted

## Simulation
Simulated using **Xilinx Vivado Simulator**.  
Waveforms verify correct data transfer and backpressure handling.
## Simulation Output
![Simulation Waveform](waveform.png)
<img width="1588" height="939" alt="Output WaveForm" src="https://github.com/user-attachments/assets/7bd5c2e7-f0df-4fb7-9634-3ce295dc1024" />
## 🧪 Simulation & Results

Simulation was performed using Vivado.
The waveform confirms:

Correct handshake behavior

Proper stalling during backpressure

No data corruption or duplication
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


## ✅ Synthesizability

Uses always_ff

No delays or non-synthesizable constructs

Parameterized data width

Safe asynchronous reset

## ✔ Fully synthesizable for FPGA/ASIC flows

## 🧠 How It Is Implemented

Single register stage

Valid bit tracks occupancy

Ready signal generated combinationally

Data updates only when transfer is allowed

This structure is commonly used in:

AXI-stream pipelines

FIFOs

High-speed datapaths

## 🏁 Conclusion

This project demonstrates a clean and efficient implementation of a single-stage pipeline register using a valid–ready protocol.
The design is simple, robust, and scalable, making it suitable for real-world hardware pipelines.

## Author
Sandeep Singh
