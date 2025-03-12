# Rock-Paper-Scissors SIS/Verilog Project

## 📌 Overview

This project implements a custom version of the Rock-Paper-Scissors game using **SIS** and **Verilog**. 
It was developed as part of a computer architecture course and features a finite state machine (FSM) 
combined with a datapath to enforce unique game rules.

## 🎮 Game Rules

- The game requires **at least 4 rounds** and a **maximum of 19**, determined at the start.
- A player **wins** by obtaining a **two-round lead** after the minimum number of rounds.
- A player **cannot repeat** their previous winning move; otherwise, the round is invalid and must be replayed.
- If both players **do not make a move**, the round is also invalid and must be replayed.
- Tied rounds are counted, and all moves are allowed in the next round.

## 🏗 System Architecture

The project consists of two main components:

1. **Finite State Machine (FSM)** – Controls the game flow and determines the winner.
2. **Datapath** – Processes inputs, manages round counting, and enforces game rules.

## 🚀 Getting Started

### Prerequisites

- **SIS** (for logic synthesis and optimization)
- **Verilog Simulator** (e.g., ModelSim, Icarus Verilog)

### Running the Simulation

1. **Clone the repository**  
   ```bash
   git clone https://github.com/morelli03/progetto-sis.git
   ```
2. **Navigate to the project folder**  
   ```bash
   cd progetto-sis
   ```
3. **Compile and simulate** using your preferred Verilog tool.

## 📂 Project Files

### SIS

- `FSMD.blif` – BLIF format file containing the synthesized FSM and datapath.
- `output_sis.txt` – Simulation output results.
- `testbench.script` – SIS simulation script for testing the implementation.

### Verilog

- `design.sv` – Main implementation of the Rock-Paper-Scissors (MorraCinese) module.
- `testbench.sv` – Testbench for simulating and validating the design.
- `output_verilog.txt` – Simulation output results showing game progression.

## 👥 Contributors

- **Marianna Frigo**
- **Riccardo Morelli**

## 📜 License

This project is licensed under the **Apache License 2.0**. See the [LICENSE](LICENSE) file for details.

## 🙌 Acknowledgments

- **University of Verona** – Department of Computer Science  
- Professors and peers for their guidance and feedback  

---

Feel free to modify it if needed! 🚀
