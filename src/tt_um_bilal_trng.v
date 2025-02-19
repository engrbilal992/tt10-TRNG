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

	assign uio_oe = 8'b0000_0000;
	assign uio_out = 8'b0000_0000;
	assign uo_out[7:3] = 5'b0_0000;
	assign ui_in[7:1] = 7'b000_0000;
	assign uio_in = 8'b0000_0000;

	
	TRNG TRNG (
	    .TRNG_Enable(rst_n),      
	    .TRNG_Clock(clk),           // Clock signal (50 MHz) for Tiny Tape out Requiremnts
	    .ctrl_mode(ui_in[0]),       // Control signal: 0 = hashed output, 1 = raw Sample_Out
	    .failure(uo_out[0]),        // Indicates if Repetition Count Test failed (if failed, bits discard other wise pass the bits to buffer to store 448 bits)
	    .UART_Tx(uo_out[2]),        // UART Transmitted Data
	    .hash_rdy(uo_out[1])        // Hash ready signal (For the use if he want to get the value of a hash, he can take it at this signal, when it goes ON, other wise it will generate continous hashed data not just 256 and stops)
	);

endmodule
