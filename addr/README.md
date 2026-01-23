# addr — Adder Design Flow (Genus + Modus)

This directory demonstrates an adder design using Cadence **Genus** for
synthesis and **Modus** for FULLSCAN DFT.

---

## Flow

### 1. Environment Setup
```bash
ssh user5@***.***.***.***
mkdir work
csh
source /home/install/cshrc
```

---

### 2. RTL Design
```bash
gedit addr.v
```

---

### 3. Synthesis (Cadence Genus)

Create synthesis script:

```tcl
# genus_synth.tcl
set_db library /home/install/FOUNDRY/digital/45nm/dig/lib/typical.lib
read_hdl addr.v
elaborate
syn_generic
syn_map
syn_opt
write_hdl > adder_gates.v
```

Run synthesis:

```bash
genus -file genus_synth.tcl
cat adder_gates.v
```

---

### 4. DFT (Cadence Modus – FULLSCAN)

```bash
csh
source /home/install/cshrc
modus -legacy_gui
```

GUI steps:
- Create new design
- Select **FULLSCAN** methodology
- Build logic model
- Provide design sources:
  ```
  /home/install/FOUNDRY/digital/45nm/NangateOpenCellLibrary_v1.00_20080225/verilog/FreePDK45_lib.v1.0_typical.v
  /home/user5/work/adder_gates.v
  ```
- Build FULLSCAN test mode
- Run ATPG

Tool-generated databases, logs, and vectors are intentionally excluded from
version control.

