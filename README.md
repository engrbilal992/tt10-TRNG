![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg) ![](../../workflows/fpga/badge.svg)

# True Random Number Generator (TRNG) for TinyTapeout ASIC Design

This project implements a True Random Number Generator (TRNG) for an ASIC design targeting TinyTapeout. The TRNG utilizes a noise source, a sampler, an 8-bit collector, and a SHA-256 conditioning module to produce high-quality random numbers suitable for cryptographic applications.

## How It Works

The TRNG operates by sampling a noise source with a digital circuit. The sampled data undergoes bias removal and conditioning through SHA-256 to ensure cryptographic-quality randomness. A state machine manages the data collection, processing, and output transmission via UART. The TRNG offers two modes:
- **Raw Entropy Output**: For raw data analysis.
- **Hashed Output**: For cryptographically secure random numbers.

Built-in health tests, such as the **Repetition Count Test** (SP800-90B), are included to validate the entropy quality.

## How to Test

1. Program the FPGA with the TRNG design.
2. Connect a UART terminal to the FPGA to receive random number outputs.
3. Toggle between raw entropy mode and hashed output mode via control signals.
4. Monitor the output stream for analysis or cryptographic usage.
5. Perform statistical tests to validate entropy quality.

## Testing on ZCU102 FPGA

This design has been tested on the **ZCU102 FPGA** to verify functionality and output quality.

## External Hardware

- **ZCU102 FPGA Board**
- **UART-to-USB Adapter** (for serial communication)
- **Oscilloscope** (for debugging the noise source, if needed)

