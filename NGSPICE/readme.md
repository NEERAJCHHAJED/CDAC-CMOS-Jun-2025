# 🧪 NGSPICE Command Reference

A concise guide to commonly used **NGSPICE commands** for analog circuit simulation. Use this as a quick reference while building and testing your circuits.

---

## 📌 Basic Simulation Commands

| Command | Description |
|--------|-------------|
| `.tran tstep tstop` | Transient analysis (time-domain) |
| `.ac dec 10 1Hz 1kHz` | AC sweep (logarithmic frequency sweep) |
| `.dc V1 0 10 1` | DC sweep (e.g., sweep voltage source V1 from 0 to 10V in 1V steps) |
| `.op` | Operating point analysis |
| `.four freq V(out)` | Fourier analysis at a given frequency |
| `.noise V(out) Vin dec 10 1Hz 1MegHz` | Noise analysis |
| `.sens V(out)` | Sensitivity analysis (parameter impact) |

---

## 🔧 Device Definitions

| Component | Syntax |
|----------|--------|
| Resistor | `R1 node1 node2 value` |
| Capacitor | `C1 node1 node2 value` |
| Inductor | `L1 node1 node2 value` |
| Voltage source | `V1 node+ node- DC 5` or `V1 node+ node- SIN(...)` |
| Current source | `I1 node+ node- DC 1m` |
| Diode | `D1 anode cathode Dmodel` |
| MOSFET | `M1 drain gate source bulk model L=... W=...` |
| BJT | `Q1 collector base emitter Qmodel` |

---

## 🧮 Control Block (`.control ... .endc`)

| Command | Description |
|---------|-------------|
| `run` | Start simulation |
| `plot V(out)` | Plot node voltage |
| `plot V(in) V(out)` | Plot multiple waveforms |
| `print V(out)` | Print node values to terminal |
| `write filename.raw` | Save results |
| `load filename.cir` | Load a circuit file |
| `destroy all` | Clear all prior data |
| `quit` | Exit NGSPICE |

---

## ⚙️ Parametric and Advanced Features

| Command | Description |
|---------|-------------|
| `.param Rval=10k` | Define a parameter |
| `R1 n1 n2 {Rval}` | Use parameter value |
| `.step param Rval list 1k 5k 10k` | Sweep values |
| `.measure tran Vpeak MAX V(out)` | Measure a value (e.g., peak) |
| `.lib path/to/library.lib` | Include model library |
| `.include filename` | Include file contents |

---

## 📂 Sample Netlist

```spice
* RC Low Pass Filter
V1 in 0 SIN(0 1 1k)
R1 in out 1k
C1 out 0 1u
.tran 1u 5m

.control
run
plot V(in) V(out)
.endc

.end

