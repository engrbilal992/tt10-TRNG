//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Muhamamd Bilal
// 
// Create Date: 02/10/2025 09:40:16 AM
// Design Name: TRNG ON ASIC
// Module Name: repetition_count_test 
// Project Name: TRNG_CONDITIONED
// Target Devices: ZCU102
// Tool Versions: Vivado 2024.1
// Description:  This is the Approved Health test for my TRNG from Sp 800 -90 B Standard.
// 
// Dependencies: Standalone Moduel with a test bench file named as test_health_rep_count.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Repetition_Count_Test (
    input wire clk,           // Clock signal
    input wire rst,           // Reset signal (active high)
    input wire bit_in,        // Input bit from the bitstream
    output reg failure        // Failure signal (asserts when test fails)
);

    parameter [5:0] CUTOFF = 32; // Maximum allowed consecutive repetitions of the same bit

    reg prev_bit;             // Register to store the previous bit
    reg [5:0] count;          // Counter to track repetitions of the same bit (6 bits for counting up to 64, we need 32)

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset the state
            prev_bit <= 1'b0;
            count <= 6'b0;
            failure <= 1'b0;
        end else begin
            if (bit_in == prev_bit) begin
                // Increment the repetition counter if the bit matches the previous one
                count <= count + 1;
                if (count >= CUTOFF) begin
                    failure <= 1'b1; // Signal failure if cutoff is exceeded
                end
            end else begin
                // Reset the counter and update the previous bit
                count <= 6'b1;
                prev_bit <= bit_in;
                failure <= 1'b0; // Clear the failure signal
            end
        end
    end
endmodule
