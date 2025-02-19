/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_bilal_trng (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    // Set unused outputs to zero
    assign uio_oe = 8'b0000_0000;
    assign uio_out = 8'b0000_0000;
    assign uo_out[7:3] = 5'b00000;

    // Capture unused signals to avoid warnings
    wire _unused = &{ena, uio_in}; // Safely use unused inputs

    TRNG TRNG (
        .TRNG_Enable(ui_in[0]),
        .TRNG_Clock(clk),         // Clock signal (50 MHz) for Tiny Tapeout requirements
        .ctrl_mode(ui_in[1]),     // Control signal: 0 = hashed output, 1 = raw Sample_Out
        .failure(uo_out[0]),      // Repetition Count Test failure flag
        .UART_Tx(uo_out[2]),      // UART Transmitted Data
        .hash_rdy(uo_out[1])      // Hash ready signal
    );

endmodule

