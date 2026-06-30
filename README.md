<div align="center">

# 🚀 Simulation and Verification of 1-Bit Full Adder using SystemVerilog

A **Class-Based SystemVerilog Verification Environment** developed to verify the functionality of a **1-Bit Full Adder** using **Object-Oriented Programming (OOP)** concepts.

![SystemVerilog](https://img.shields.io/badge/SystemVerilog-IEEE%201800-blue?style=for-the-badge)
![Verification](https://img.shields.io/badge/Verification-Class%20Based-success?style=for-the-badge)
![OOP](https://img.shields.io/badge/OOP-SystemVerilog-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

</div>

---

# 📖 Project Overview

This project demonstrates the **functional verification** of a **1-Bit Full Adder** by developing a reusable **Class-Based Verification Environment** in **SystemVerilog**.

Instead of manually applying test vectors, the verification environment automatically:

- 🎲 Generates random input transactions
- 🚗 Drives inputs to the DUT
- 👀 Monitors DUT activity
- ✅ Compares DUT outputs with the expected outputs
- 📊 Displays **PASS** or **FAIL** for every transaction

The project is designed to help understand the **fundamentals of Design Verification**, which form the basis of advanced verification methodologies such as **UVM (Universal Verification Methodology)**.

---

# 📋 Project Summary

| Property | Description |
|----------|-------------|
| **Project** | Simulation and Verification of 1-Bit Full Adder |
| **Language** | SystemVerilog |
| **Verification Methodology** | Class-Based Verification |
| **Communication Mechanism** | Mailbox |
| **Interface Type** | Virtual Interface |
| **Testbench Type** | Self-Checking Testbench |
| **Design Under Test** | 1-Bit Full Adder |
| **Simulation Tool** | ModelSim / QuestaSim / EDA Playground |

---

# 🏗️ Verification Architecture

<p align="center">
    <img src="sv_simple_tb_with_scb.png" alt="Verification Architecture" width="1000">
</p>

The verification environment consists of the following components:

- **Generator** – Creates randomized transactions.
- **Mailbox (gen2drv)** – Transfers transactions from Generator to Driver.
- **Driver** – Drives DUT inputs through the Virtual Interface.
- **Interface** – Connects the verification environment with the DUT.
- **Full Adder (DUT)** – Performs addition and generates Sum & Carry.
- **Monitor** – Captures DUT inputs and outputs.
- **Mailbox (mon2scb)** – Transfers monitored transactions to the Scoreboard.
- **Scoreboard** – Verifies DUT outputs using a reference model.

---

# 🔄 Verification Flow

```
Random Transaction
        │
        ▼
 Generator
        │
        ▼
 Mailbox (gen2drv)
        │
        ▼
 Driver
        │
        ▼
 Virtual Interface
        │
        ▼
  Full Adder (DUT)
        │
        ▼
 Monitor
        │
        ▼
 Mailbox (mon2scb)
        │
        ▼
 Scoreboard
        │
        ▼
 PASS / FAIL
```

---

# 📂 Repository Structure

```
Simulation-and-verification-of-FULL-ADDER-using-System-Verilog
│
├── design.sv
├── interface.sv
├── transaction.sv
├── generator.sv
├── driver.sv
├── monitor.sv
├── scoreboard.sv
├── environment.sv
├── test.sv
├── testbench.sv
└── README.md
```

---

# 🧩 Verification Components

## 📦 Transaction

The **Transaction** class acts as a packet containing all DUT signals.

### Responsibilities

- Stores DUT input signals
- Stores DUT output signals
- Supports randomization
- Used by all verification components

---

## 🎲 Generator

The Generator creates randomized transactions and sends them to the Driver through a mailbox.

### Responsibilities

- Creates Transaction objects
- Randomizes DUT inputs
- Sends transactions to Driver

---

## 🚗 Driver

The Driver receives transactions from the Generator and drives DUT inputs through the Virtual Interface.

### Responsibilities

- Receives transaction from mailbox
- Drives DUT inputs
- Synchronizes stimulus

---

## 🔌 Interface

The Interface groups all DUT signals into a single communication channel between the DUT and the verification environment.

---

## ⚙️ Full Adder (DUT)

The DUT implements a **1-Bit Full Adder**.

### Logic

```
Sum   = A ⊕ B ⊕ Cin

Carry = (A & B) | (B & Cin) | (A & Cin)
```

---

## 👀 Monitor

The Monitor passively observes DUT inputs and outputs.

### Responsibilities

- Samples DUT signals
- Creates observed transaction
- Sends captured transaction to Scoreboard

---

## ✅ Scoreboard

The Scoreboard acts as the **Reference Model**.

It calculates the expected outputs independently and compares them with the DUT outputs.

### Responsibilities

- Receives monitored transaction
- Computes expected Sum & Carry
- Compares Expected vs Actual
- Displays PASS / FAIL

---

## 🌍 Environment

The Environment connects all verification components.

It creates:

- Generator
- Driver
- Monitor
- Scoreboard
- Mailboxes
- Virtual Interface connections

---

## 🧪 Test

The Test class creates the Environment and starts the complete verification process.

---

# ⚡ Simulation Flow

### Step 1

Generator creates random input combinations.

```
A = 0
B = 1
Cin = 1
```

⬇

### Step 2

Driver receives the transaction and drives DUT inputs.

⬇

### Step 3

The DUT computes

```
Sum

Carry
```

⬇

### Step 4

Monitor captures DUT inputs and outputs.

⬇

### Step 5

Scoreboard computes the expected outputs.

⬇

### Step 6

Expected Output

```
VS
```

Actual DUT Output

⬇

```
PASS
```

or

```
FAIL
```

---

# ✨ Features

- ✅ Class-Based Verification
- ✅ Object-Oriented Programming (OOP)
- ✅ Randomized Transaction Generation
- ✅ Mailbox-Based Communication
- ✅ Virtual Interface
- ✅ Self-Checking Scoreboard
- ✅ Modular Verification Components
- ✅ Reusable Testbench Architecture
- ✅ Functional Verification

---

# 📚 SystemVerilog Concepts Used

- Classes
- Objects
- Constructors
- Randomization
- Transactions
- Mailboxes
- Virtual Interface
- Generator
- Driver
- Monitor
- Scoreboard
- Environment
- Test
- Self-Checking Testbench

---

# ▶️ Running the Simulation

Compile all the SystemVerilog files.

Example using ModelSim / QuestaSim:

```tcl
vlog *.sv
vsim testbench
run -all
```

---

# 📊 Expected Simulation Output

```
Generator Class Signals

A = 0
B = 1
Cin = 1

↓

Driver Class Signals

↓

Monitor Class Signals

↓

**************** PASS ****************
```

---

# 📈 Simulation Waveform *(Optional)*

<p align="center">
    <img src="images/waveform.png" width="950">
</p>

---

# 💻 Console Output *(Optional)*

<p align="center">
    <img src="images/console_output.png" width="950">
</p>

---

# 🚀 Future Improvements

- Functional Coverage
- SystemVerilog Assertions (SVA)
- Parameterized Full Adder
- Coverage-Driven Verification
- UVM-Based Verification Environment
- Regression Automation

---

# 👨‍💻 Author

**Lijin Wilson**

🎓 M.Tech – VLSI Design

🏫 Lovely Professional University

📧 Email: *Add your email here*

🔗 GitHub: https://github.com/LijinWilson

---

<div align="center">

### ⭐ If you found this project useful, consider giving it a Star!

</div>
