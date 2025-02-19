
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Muhamamd Bilal
// 
// Create Date: 02/10/2025 09:40:16 AM
// Design Name: TRNG ON ASIC (Version one submission for Tiny tape out, will use skywater 130 nm technology (open source))
// Module Name: TRNG
// Project Name: TRNG_V1
// Target Devices: ZCU102
// Tool Versions: Vivado 2024.1
// Description: This module implements a top-level True Random Number Generator (TRNG) designed for ASICs 
//              and validated on the ZCU102 FPGA. It integrates multiple submodules, including a noise source, sampler
//              and a SHA-256-based conditioner for cryptographic-grade randomness. 
//              The TRNG operates in two modes: hashed output mode for secure applications and raw output mode for entropy analysis. 
//              It features a state machine with modes for data collection, hashing, and UART-based transmission. 
//              Health tests, such as the Repetition Count Test, ensure the quality of generated random bits. 
//              The module is optimized for TinyTapeout requirements, including a 50 MHz clock input.
// 
// Dependencies: Repitition test count.v , SHA256 Files , Trng.v , uart_tx.v
// 
// Revision: 1.1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

/////////////////////////////// EXOR_Gate /////////////////////////////////
module EXOR_Gate
(
    EXOR_Gate_In1,
    EXOR_Gate_In2,
    EXOR_Gate_In3,
    EXOR_Gate_In4,
    EXOR_Gate_In5,
    EXOR_Gate_Out
);

input EXOR_Gate_In1;
input EXOR_Gate_In2;
input EXOR_Gate_In3;
input EXOR_Gate_In4;
input EXOR_Gate_In5;
output EXOR_Gate_Out;

assign EXOR_Gate_Out = EXOR_Gate_In1 ^ EXOR_Gate_In2 ^ EXOR_Gate_In3 ^ EXOR_Gate_In4 ^ EXOR_Gate_In5;

endmodule

/////////////////////////////// NOT_Gate /////////////////////////////////
//- Module Declaration ----------------------------------------------------------
module NOT_Gate
(
	NOT_Gate_In,
	NOT_Gate_Out
);
//- Ports -----------------------------------------------------------------------					
input	NOT_Gate_In;	// NOT Gate input.
output	NOT_Gate_Out;	// NOT Gate output.
//- Functionality ---------------------------------------------------------------
assign NOT_Gate_Out = ~ NOT_Gate_In;
//-------------------------------------------------------------------------------
endmodule

/////////////////////////////// NAND_Gate /////////////////////////////////
//- Module Declaration ----------------------------------------------------------
module NAND_Gate
(
	NAND_Gate_In1,
	NAND_Gate_In2,
	NAND_Gate_Out
);			
input NAND_Gate_In1;	// Input 1 of NAND Gate
input NAND_Gate_In2; // Input 2 of NAND Gate
output NAND_Gate_Out;	// Output of NAND Gate
//- Functionality ---------------------------------------------------------------
assign NAND_Gate_Out = ~ (NAND_Gate_In1 & NAND_Gate_In2);
//-------------------------------------------------------------------------------
endmodule

/////////////////////////////// Noise_Source_Loop /////////////////////////////////
//- Module Declaration ----------------------------------------------------------
(* dont_touch = "true" *)module Noise_Source_Loop
(
	Noise_Source_Loop_In,
	Noise_Source_Loop_Out
);
//- Ports -----------------------------------------------------------------------
(* dont_touch = "true" *)input	Noise_Source_Loop_In;	// FeedBack from the output
(* dont_touch = "true" *)output	Noise_Source_Loop_Out;	// Output and FeedBack to the input
//- Connections -----------------------------------------------------------------
(* dont_touch = "true" *)wire	NAND1_OUT_TO_NOT1_IN;
(* dont_touch = "true" *)wire	NOT1_OUT_TO_NOT2_IN;
(* dont_touch = "true" *)wire	NOT2_OUT_TO_NAND1_IN2;
//- Instantiation (NAND_Gate) ---------------------------------------------------
(* dont_touch = "true" *)NAND_Gate NAND_1
(
	 (* dont_touch = "true" *).NAND_Gate_In1(Noise_Source_Loop_In), 
	 (* dont_touch = "true" *).NAND_Gate_In2(NOT2_OUT_TO_NAND1_IN2), 
	 (* dont_touch = "true" *).NAND_Gate_Out(NAND1_OUT_TO_NOT1_IN)
);
//- Instantiation (NOT_Gate 1) --------------------------------------------------				
(* dont_touch = "true" *)NOT_Gate NOT_1 
(
	(* dont_touch = "true" *).NOT_Gate_In(NAND1_OUT_TO_NOT1_IN), 
	(* dont_touch = "true" *).NOT_Gate_Out(NOT1_OUT_TO_NOT2_IN)
);			
//- Instantiation (NOT_Gate 2) --------------------------------------------------					
(* dont_touch = "true" *)NOT_Gate NOT_2 
(
	 (* dont_touch = "true" *).NOT_Gate_In(NOT1_OUT_TO_NOT2_IN), 
	 (* dont_touch = "true" *).NOT_Gate_Out(NOT2_OUT_TO_NAND1_IN2)
);			
//- Output Connection -----------------------------------------------------------					
assign	Noise_Source_Loop_Out = NOT2_OUT_TO_NAND1_IN2;
//-------------------------------------------------------------------------------
endmodule

/////////////////////////////// Extension /////////////////////////////////
//- Module Declaration ----------------------------------------------------------
module Extension
(
	Extension_In,
	Extension_Out1,
	Extension_Out2,
	Extension_Out3,
	Extension_Out4,
	Extension_Out5
);
//- Ports -----------------------------------------------------------------------			
input	Extension_In;
output	Extension_Out1;
output	Extension_Out2;
output	Extension_Out3;
output	Extension_Out4;
output	Extension_Out5;
//- Functionality ---------------------------------------------------------------
assign Extension_Out1 = Extension_In;
assign Extension_Out2 = Extension_In;
assign Extension_Out3 = Extension_In;
assign Extension_Out4 = Extension_In;
assign Extension_Out5 = Extension_In;
//-------------------------------------------------------------------------------
endmodule

/////////////////////////////// Noise_Source /////////////////////////////////
//- Module Declaration ----------------------------------------------------------
(* KEEP = "true" *)module Noise_Source
(
	Noise_Source_In,
	Noise_Source_Out
);
//- Ports -----------------------------------------------------------------------					
(* KEEP = "true" *)input Noise_Source_In;	// Active Low. Acts as enable for the loop
(* KEEP = "true" *)output Noise_Source_Out; // Noise

//- Connections -----------------------------------------------------------------

(* KEEP = "true" *)wire	Loop1_Out_EXOR_In1;
(* KEEP = "true" *)wire	Loop2_Out_EXOR_In2;
(* KEEP = "true" *)wire	Loop3_Out_EXOR_In3;
(* KEEP = "true" *)wire	Loop4_Out_EXOR_In4;
(* KEEP = "true" *)wire	Loop5_Out_EXOR_In5;
(* KEEP = "true" *)wire	Noise_Source_In1;
(* KEEP = "true" *)wire	Noise_Source_In2;
(* KEEP = "true" *)wire	Noise_Source_In3;
(* KEEP = "true" *)wire	Noise_Source_In4;
(* KEEP = "true" *)wire	Noise_Source_In5;

//- Instantiation (Extension) ---------------------------------------------------
(* KEEP = "true" *)Extension Ext 
(
	 (* KEEP = "true" *).Extension_In	(Noise_Source_In), 
	 (* KEEP = "true" *).Extension_Out1	(Noise_Source_In1),
	 (* KEEP = "true" *).Extension_Out2	(Noise_Source_In2),
	 (* KEEP = "true" *).Extension_Out3	(Noise_Source_In3),
	 (* KEEP = "true" *).Extension_Out4	(Noise_Source_In4),
	 (* KEEP = "true" *).Extension_Out5	(Noise_Source_In5)
);
//- Instantiation (Noise Source Loop 1) -------------------------------------
(* KEEP = "true" *)Noise_Source_Loop Loop1 
(
	 (* KEEP = "true" *).Noise_Source_Loop_In		(Noise_Source_In1), 
	 (* KEEP = "true" *).Noise_Source_Loop_Out		(Loop1_Out_EXOR_In1)
);
//- Instantiation (Noise Source Loop 2) -------------------------------------
(* KEEP = "true" *)Noise_Source_Loop Loop2 
(
	 (* KEEP = "true" *).Noise_Source_Loop_In		(Noise_Source_In2), 
	 (* KEEP = "true" *).Noise_Source_Loop_Out		(Loop2_Out_EXOR_In2)
);
//- Instantiation (Noise Source Loop 3) -------------------------------------
(* KEEP = "true" *)Noise_Source_Loop Loop3
(
	 (* KEEP = "true" *).Noise_Source_Loop_In		(Noise_Source_In3), 
	 (* KEEP = "true" *).Noise_Source_Loop_Out		(Loop3_Out_EXOR_In3)
);
//- Instantiation (Noise Source Loop 4) -------------------------------------
(* KEEP = "true" *)Noise_Source_Loop Loop4
(
	 (* KEEP = "true" *).Noise_Source_Loop_In		(Noise_Source_In4), 
	 (* KEEP = "true" *).Noise_Source_Loop_Out		(Loop4_Out_EXOR_In4)
);
//- Instantiation (Noise Source Loop 5) -------------------------------------
(* KEEP = "true" *)Noise_Source_Loop Loop5
(
	 (* KEEP = "true" *).Noise_Source_Loop_In		(Noise_Source_In5), 
	 (* KEEP = "true" *).Noise_Source_Loop_Out		(Loop5_Out_EXOR_In5)
);
//- Instantiation (EXOR_Gate) ---------------------------------------------------
(* KEEP = "true" *)EXOR_Gate EXOR1 
(
	 (* KEEP = "true" *).EXOR_Gate_In1				(Loop1_Out_EXOR_In1), 
	 (* KEEP = "true" *).EXOR_Gate_In2				(Loop2_Out_EXOR_In2), 
	 (* KEEP = "true" *).EXOR_Gate_In3				(Loop3_Out_EXOR_In3),
	 (* KEEP = "true" *).EXOR_Gate_In4				(Loop4_Out_EXOR_In4),
	 (* KEEP = "true" *).EXOR_Gate_In5				(Loop5_Out_EXOR_In5),
	 (* KEEP = "true" *).EXOR_Gate_Out				(Noise_Source_Out)
);							
//-------------------------------------------------------------------------------
endmodule

/////////////////////////////// Noise_Sampler /////////////////////////////////
//- Module Declaration ----------------------------------------------------------
module Noise_Sampler
(
	Noise_In,
	Clock_In,
	Sample_Out
);
//- Ports -----------------------------------------------------------------------					
input Noise_In;
input Clock_In;
output Sample_Out;
//- Registers -------------------------------------------------------------------
reg	Sample_Out;
//- Functionality ---------------------------------------------------------------
always@(posedge Clock_In)
	Sample_Out <= Noise_In ? 1 : 0;
//-------------------------------------------------------------------------------
endmodule

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Top Level Module Version 1 TRNG whihc depends on control signal and enable signal, control signal is for user, 
// whenever he wans to output RAW data or hashed data. (Default output is hashed data when enable is ON)
// This module has a conroller state machine which has 6 states, IDLE, COLLECT_HASH, HASH, TRANSMIT_HASH, COLLECT_RAW, TRANSMIT_RAW
module TRNG (
    input TRNG_Enable,          // TRNG outputs random bits till the time this signal is asserted.
    input TRNG_Clock,           // Clock signal (50 MHz) for Tiny Tape out Requiremnts
    input ctrl_mode,            // Control signal: 0 = hashed output, 1 = raw Sample_Out
    output wire failure,        // Indicates if Repetition Count Test failed (if failed, bits discard other wise pass the bits to buffer to store 448 bits)
    output wire UART_Tx,        // UART Transmitted Data
    output wire hash_rdy        // Hash ready signal (For the use if he want to get the value of a hash, he can take it at this signal, when it goes ON, other wise it will generate continous hashed data not just 256 and stops)
);

    // Internal Connections
    wire Noise_Connect;
    wire Sample_Out;
    reg [8:0] bit_counter;   // For counting 448 bits (hash mode)
    reg [2:0] raw_bit_counter; // For counting 8 bits (raw mode)
    reg discard;          // Indicates whether bits are being discarded
    reg [447:0] Word_Out;        // 448-bit collected data (hash mode)
    reg [7:0] raw_byte;          // 8-bit collected data (raw mode)
    reg [511:0] Padded_Out;      // 512-bit padded data for SHA-256 requirment for one block processing
    reg Word_Valid;              // Indicates when Padded_Out is valid means it has 512 bits = ({448 data , 63 Zeros , length in 64 bits})
    reg [4:0] chunk_index;   // Index for selecting 8-bit hash chunks (32 chunks then goes 0 and start over)
    reg [7:0] chunk_reg;         // Register to hold current 8-bit chunk (hash mode)
    wire [255:0] hash;           // Full 256-bit hash output

    // UART TX Signals
    reg uart_start;
//    wire uart_done;
    wire uart_busy;

    // Synchronize ctrl_mode to avoid metastability
    reg [1:0] ctrl_mode_sync;
    reg prev_ctrl_mode;

    // State Machine for Both Modes (HASHED and RAW)
    reg [2:0] state;
    localparam STATE_IDLE          = 3'b000;
    localparam STATE_COLLECT_HASH  = 3'b001;
    localparam STATE_HASH          = 3'b010;
    localparam STATE_TRANSMIT_HASH = 3'b011;
    localparam STATE_COLLECT_RAW   = 3'b100;
    localparam STATE_TRANSMIT_RAW  = 3'b101;

    // Noise Source Instantiation
    Noise_Source NOISE_SOURCE (
        .Noise_Source_In(TRNG_Enable), 
        .Noise_Source_Out(Noise_Connect)
    );

    // Noise Sampler Instantiation
    Noise_Sampler NOISE_SAMPLER (
        .Noise_In(Noise_Connect), 
        .Clock_In(TRNG_Clock), 
        .Sample_Out(Sample_Out)
    );

    // Repetition Count Test Instantiation
    Repetition_Count_Test #(.CUTOFF(32)) Repetition_Count_Test (
        .clk(TRNG_Clock),       // Clock signal
        .rst(!TRNG_Enable),     // Reset signal (active high)
        .bit_in(Sample_Out),    // Input bit from the bitstream
        .failure(failure)       // Failure signal (asserts when test fails)
    );
    
    // SHA256 Module Instantiation
    SHA256 sha256 (
        .M(Padded_Out),
        .start(Word_Valid),
        .clk(TRNG_Clock),
        .HASH(hash),
        .hash_rdy(hash_rdy) 
    );
    
    // UART TX Instantiation
    uart_tx #(
        .TICKS_PER_BIT(435), // for 50 MHz clock it will be 435 with baud rate of 115200
        .TICKS_PER_BIT_SIZE(9)
    ) uart_tx_inst (
        .i_clk(TRNG_Clock),
        .i_start(uart_start),
        .i_data(ctrl_mode_sync[1] ? raw_byte : chunk_reg), // ctrl_mode
        .o_done(),
        .o_busy(uart_busy),
        .o_dout(UART_Tx)
    );

    
    // Synchronize ctrl_mode and detect edges
    always @(posedge TRNG_Clock or negedge TRNG_Enable) begin
        if (!TRNG_Enable) begin
            ctrl_mode_sync <= 2'b00;
            prev_ctrl_mode <= 1'b0;
        end else begin
            ctrl_mode_sync <= {ctrl_mode_sync[0], ctrl_mode}; // 2-stage synchronizer
            prev_ctrl_mode <= ctrl_mode_sync[1]; // Track previous synchronized value
        end
    end

    // State Machine for Both Modes
    always @(posedge TRNG_Clock or negedge TRNG_Enable) begin
        if (!TRNG_Enable) begin
            state <= STATE_IDLE;
            Word_Out <= 448'b0;
            raw_byte <= 8'b0;
            Padded_Out <= 512'b0;
            Word_Valid <= 1'b0;
            bit_counter <= 9'b0;
            raw_bit_counter <= 3'b0;
            discard <= 1'b0;
            chunk_index <= 5'd0;
            uart_start <= 1'b0;
        end else begin
            // Detect mode change and reset state machine
            if (prev_ctrl_mode != ctrl_mode_sync[1]) begin
                state <= STATE_IDLE;
                raw_byte <= 8'b0;
                bit_counter <= 9'b0;
                raw_bit_counter <= 3'b0;
            end

            case (state)
                // Idle: Select mode based on synchronized ctrl_mode
                STATE_IDLE: begin
                    if (ctrl_mode_sync[1] == 0) begin
                        state <= STATE_COLLECT_HASH; // Hash mode
                        bit_counter <= 9'b0;
                        Word_Out <= 448'b0; // Reset collected data
                    end else begin
                        state <= STATE_COLLECT_RAW;  // Raw mode
                        raw_bit_counter <= 3'b0;
                        raw_byte <= 8'b0; // Reset raw byte
                    end
                end

                // Hash Mode: Collect 448 bits
                STATE_COLLECT_HASH: begin
                    if (failure) begin
                        discard <= 1'b1;
                        bit_counter <= 9'b0;
                    end else if (discard) begin
                        discard <= 1'b0;
                    end else begin
                        Word_Out <= {Word_Out[446:0], Sample_Out}; 
                        bit_counter <= bit_counter + 1;

                        if (bit_counter == 9'd447) begin
                            Padded_Out <= {Word_Out[446:0], 1'b1, 64'd448};
                            Word_Valid <= 1'b1; // Start SHA256 hashing
                            state <= STATE_HASH;
                        end else begin
                            Word_Valid <= 1'b0; // Deassert after one cycle
                        end
                    end
                end

                // Hash Mode: Wait for hash computation
                STATE_HASH: begin
                    Word_Valid <= 1'b0; // Ensure Word_Valid is only ON for one cycle
                    if (hash_rdy) begin
                        state <= STATE_TRANSMIT_HASH;
                        chunk_index <= 5'd0;
                    end
                end

                // Hash Mode: Transmit 32-byte hash
                STATE_TRANSMIT_HASH: begin
                    if (!uart_busy && !uart_start) begin
                        if ({1'b0,chunk_index} < 6'd32) begin
                            chunk_reg <= hash[chunk_index*8 +: 8]; // Load 8-bit chunk
                            uart_start <= 1'b1; // Trigger UART transmission
                            chunk_index <= chunk_index + 1;
                        end else begin
                            state <= STATE_COLLECT_HASH; // Repeat collection
                            Word_Out <= 448'b0;
                            bit_counter <= 9'b0;
                        end
                    end else begin
                        uart_start <= 1'b0; // Ensure single-cycle pulse
                    end
                end

                // Raw Mode: Collect 8 bits
                STATE_COLLECT_RAW: begin
                    if (failure) begin
                        discard <= 1'b1;
                        raw_bit_counter <= 3'b0;
                    end else if (discard) begin
                        discard <= 1'b0;
                    end else begin
                        raw_byte <= {raw_byte[6:0], Sample_Out}; // Shift in New bit (Shift register)
                        raw_bit_counter <= raw_bit_counter + 1;

                        if (raw_bit_counter == 3'd7) begin
                            state <= STATE_TRANSMIT_RAW; // Ready to transmit data (wil do this in next state)
                        end
                    end
                end

                // Raw Mode: Transmit 1 byte
                STATE_TRANSMIT_RAW: begin
                    if (!uart_busy && !uart_start) begin
                        uart_start <= 1'b1; // Trigger UART transmission
                        state <= STATE_COLLECT_RAW; // Collect next byte
                        raw_bit_counter <= 3'b0;
                    end else begin
                        uart_start <= 1'b0; // Ensure single-cycle pulse
                    end
                end

                default: state <= STATE_IDLE;
            endcase
        end
    end
endmodule
