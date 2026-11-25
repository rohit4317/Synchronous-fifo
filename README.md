# Synchronous FIFO using Verilog HDL

## Overview
A parameterized first-in-first-out (FIFO) buffer with a single clock, synchronous active-high reset, write enable and read enable.

## Features
- Parameterized data width and depth
- Read and write pointers
- Occupancy counter
- Full and empty status flags
- Prevents writes when full and reads when empty

## Files
- `rtl/sync_fifo.v` — synthesizable RTL
- `tb/tb_sync_fifo.v` — basic testbench

## Run simulation
```bash
iverilog -g2012 -o fifo_sim rtl/sync_fifo.v tb/tb_sync_fifo.v
vvp fifo_sim
```

## Concepts demonstrated
Sequential logic, pointer management, memory arrays, counters, status flags and boundary conditions.

Note: This is a learning implementation. For production use, review simultaneous read/write behavior, memory inference and reset strategy for the target technology.
