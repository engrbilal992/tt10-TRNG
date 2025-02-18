`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:19:42 06/09/2008 
// Design Name: 
// Module Name:    finalsum 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module finalsum
		(
			sum_0,
			data1_from_ram,
			data2_from_ram,
			clk,
			final_sum
		);

input	[31:0]	sum_0;
input	[31:0]	data1_from_ram;
input	[31:0]	data2_from_ram;
input			clk;
output	[31:0]	final_sum;


reg	[31:0]	final_sum;


always @ (posedge clk)
 final_sum <= sum_0 + data1_from_ram + data2_from_ram;


endmodule
