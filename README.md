### For Windows:
Download the installers from the official sites of [Icarus Verilog](http://bleyer.org/icarus/) and [GTKWave](http://gtkwave.sourceforge.net/).

---

## 💻 How to Run the Simulation

Follow these steps to compile the design and view the results:

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/alprnayd/universal-shift-register.git](https://github.com/alprnayd/universal-shift-register.git)
    cd universal-shift-register
    ```

2.  **Compile the Design and Testbench:**
    ```bash
    iverilog -o usr_sim.out usr.v usr_tb.v
    ```

3.  **Execute the Simulation:**
    ```bash
    vvp usr_sim.out
    ```
    *This will generate a `usr_result.vcd` file.*

4.  **View Results in GTKWave:**
    ```bash
    gtkwave usr_result.vcd
    ```

---

## 📊 Test Scenario
The included `testbench` performs the following sequence to verify the hardware logic:
1.  **Reset:** Initializes the system to `0000`.
2.  **Parallel Load:** Loads the value `1010`.
3.  **Hold:** Verifies that the value remains unchanged.
4.  **Shift Right:** Shifts the data with a serial '1' input.
5.  **Shift Left:** Shifts the data back with a serial '1' input.

---

## 📂 Project Structure
*   `usr.v`: The main Verilog module containing the hardware logic.
*   `usr_tb.v`: The testbench file providing the clock signal and test stimuli.
*   `usr_result.vcd`: Simulation output file for waveform analysis.
*   `README.md`: Project documentation.

# 4-Bit Universal Shift Register

This project implements a **4-bit Universal Shift Register (USR)** using Verilog HDL. The design is based on a behavioral model that utilizes 4x1 Multiplexers and D-type Flip-Flops to perform various data operations.

## 🚀 Features
The USR supports four distinct operations controlled by two selection lines ($S_1, S_0$):
*   **Hold (00):** Maintains the current state by feeding the output back to the input.
*   **Shift Right (01):** Shifts bits to the right, accepting a serial input from the left.
*   **Shift Left (10):** Shifts bits to the left, accepting a serial input from the right.
*   **Parallel Load (11):** Loads 4-bit parallel data into the register in a single clock cycle.



---

## 🛠 Installation & Prerequisites

To run the simulation and verify the design, you need to have the following tools installed:
*   **Icarus Verilog:** For compiling and simulating Verilog code.
*   **GTKWave:** For visualizing the output waveforms (.vcd files).

### For Ubuntu/Debian:
```bash
sudo apt-get install iverilog gtkwave