# Hi, I'm Abolfazl Azad 👋

🎓 B.Sc. Electrical Engineering Student  
💻 Interested in Digital Systems, Embedded Systems, and Computer Architecture  
🚀 Aspiring for graduate studies and research

## 🧠 About Me
- ⚡ Electrical Engineering undergraduate student with a strong foundation in math, signal processing, and system-level thinking.
- 🔍 Focused on building practical and efficient solutions in:
  - 🔹 Digital Systems
  - 🔹 Computer Architecture
  - 🔹 Embedded Systems
  - 🔹 Hardware Design
- 🧪 I enjoy bridging theory and implementation through simulation, modeling, and hands-on lab work.

## 🛠️ Technical Skills
- 💬 Languages: C, C++, MATLAB, Verilog/HDL
- 🧰 Tools: ModelSim, Multisim, Proteus, Simulink
- 📚 Core Areas: Digital Systems, Control Systems, Signal Processing

<<<<<<< HEAD
## 📌 Featured Projects
- 🔹 Digital Logic Design Projects
- 🔹 Computer Architecture Labs
- 🔹 Control Systems Simulations
- 🔹 Signal Processing Projects
=======
The implementation is organized into three main parts:

1. **Q1 - Audio analysis of `teletext.wav`**
2. **Q2 - Speech recovery from echoed/noisy signal `y.wav`**
3. **Q3 - Frequency-domain image filtering on `a.tif`**

Core topics used in this project:
- FFT / STFT analysis
- Autocorrelation-based echo parameter estimation
- FIR/IIR filtering for de-echo and noise reduction
- 2D FFT image filtering (Ideal, Butterworth, Gaussian)

## Repository Structure

```text
.
+-- CA2.pdf
+-- Data
|   +-- teletext.wav
|   +-- y.wav
|   +-- a.tif
+-- codes_and_outputs
|   +-- Q1_1.m ... Q1_3.m
|   +-- Q2_1.m ... Q2_8.m
|   +-- Q3_1.m ... Q3_5.m
|   +-- frequency_filter.m
|   +-- gaussian_lp_no_pad.m
|   +-- fdatool_BP.m
|   +-- design_lowpass_filter.m
|   +-- generated .wav outputs
+-- report
    +-- report.pdf
    +-- Abolfazl Azad 810102385.docx
```

## Part-by-Part Description

### Q1: `teletext.wav` Analysis.

- Loads audio and reports sampling frequency
- Estimates power spectrum using FFT (`Ts`-scaled)
- Plots STFT spectrogram
- Includes optional extraction of dominant frequencies per frame

Files:
- `codes_and_outputs/Q1_1.m`
- `codes_and_outputs/Q1_2.m`
- `codes_and_outputs/Q1_3.m`

### Q2: Echo/Noise Removal and Speech Recovery (`y.wav`)

- Spectral analysis and rough bandwidth estimation
- Autocorrelation analysis (`xcorr`) to estimate echo delays/gains
- Inverse channel modeling for signal recovery
- Echo cancellation with both FIR and IIR approaches
- Bandpass filtering for cleaner speech
- Additional vocal-band attenuation experiment (bandstop/notch-style)

Files:
- `codes_and_outputs/Q2_1.m` to `codes_and_outputs/Q2_8.m`
- `codes_and_outputs/fdatool_BP.m`

Generated audio outputs:
- `codes_and_outputs/x_recovered.wav`
- `codes_and_outputs/x_removed_echo_FIR.wav`
- `codes_and_outputs/x_removed_echo_IIR.wav`
- `codes_and_outputs/x_final_no_echo_no_noise.wav`
- `codes_and_outputs/x_final_enhanced_vocal.wav`
- `codes_and_outputs/x_final_attenuated_vocal.wav`

### Q3: Frequency-Domain Image Filtering (`a.tif`)

- Creates a synthetic binary image and inspects its 2D FFT spectrum
- Applies low-pass filters:
  - Ideal
  - Butterworth
  - Gaussian
- Compares multiple cutoff values (`D0`)
- Compares Gaussian low-pass filtering with and without zero-padding

Files:
- `codes_and_outputs/Q3_1.m` to `codes_and_outputs/Q3_5.m`
- `codes_and_outputs/frequency_filter.m`
- `codes_and_outputs/gaussian_lp_no_pad.m`

## Requirements

- MATLAB (recommended: R2024a or newer)
- Signal Processing Toolbox
- Image Processing Toolbox
- DSP System Toolbox (for `dfilt` objects used in some scripts)

## How to Run

The scripts use relative paths like `Data/...`, so run them from the **project root**:

```matlab
cd('path/to/CA2 (1)')
addpath('codes_and_outputs')
```

Recommended execution order:

1. Q1
```matlab
run('codes_and_outputs/Q1_1.m');
run('codes_and_outputs/Q1_2.m');
run('codes_and_outputs/Q1_3.m');
```

2. Q2
```matlab
run('codes_and_outputs/Q2_1.m'); run('codes_and_outputs/Q2_2.m');
run('codes_and_outputs/Q2_3.m'); run('codes_and_outputs/Q2_4.m');
run('codes_and_outputs/Q2_5.m'); run('codes_and_outputs/Q2_6.m');
run('codes_and_outputs/Q2_7.m'); run('codes_and_outputs/Q2_8.m');
```

3. Q3
```matlab
run('codes_and_outputs/Q3_1.m');
run('codes_and_outputs/Q3_2.m');
run('codes_and_outputs/Q3_3.m');
run('codes_and_outputs/Q3_5.m');
```

Notes:
- Some scripts depend on variables from previous scripts (shared MATLAB workspace), so order matters.
- `codes_and_outputs/Q3_4.m` is currently empty.
- Output file locations depend on MATLAB Current Folder.

## Report

The full report is available at:
- `report/report.pdf`
>>>>>>> ee66b47d4409df9c2c068d73c569bd7a92984484

## 🎯 Current Goals
- 🚀 Deepen expertise in digital design and low-level system architecture.
- 🧠 Build stronger research experience in embedded and hardware-oriented topics.
- 🎓 Prepare for graduate studies with a focus on impactful engineering problems.
