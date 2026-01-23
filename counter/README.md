
---

## 🧠 Design Description

The counter is a **clock-driven sequential circuit** that increments its output on every rising edge of the clock.  
It includes:
- **Synchronous operation**
- **Reset functionality**
- Optional **scan enable / scan input** for testability (DFT concepts)

---

## 🧪 Verification Methodology

Functional verification is performed using a **self-checking Verilog testbench**:
- Clock generation
- Reset assertion and deassertion
- Normal counting operation
- Output monitoring using `$monitor` and waveform dumping

Waveforms are captured in **VCD format** and analyzed using **GTKWave**.

---

## ⚙️ Synthesis Flow

The RTL design is synthesized using **Yosys**, generating:
- Gate-level Verilog netlist
- BLIF netlist for further backend or testing flows

This validates the synthesizability of the design and bridges RTL to gate-level implementation.

---

## 🛠 Tools Used

- **Verilog HDL**
- **Icarus Verilog (iverilog)** – Simulation
- **GTKWave** – Waveform visualization
- **Yosys** – RTL synthesis

---

## ▶️ How to Run Simulation

From the `counter/` directory:

```bash
iverilog -o counter_sim rtl/counter.v rtl/counter_top.v tb/counter_tb.v
vvp counter_sim
gtkwave scan.vcd

