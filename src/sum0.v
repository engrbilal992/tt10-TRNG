`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:38:14 06/09/2008 
// Design Name: 
// Module Name:    sum0 
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
module sum0
		(
			sig_0,
			sig_1,
			clk,
			sum_0
		);

input	[31:0]	sig_0;
input	[31:0]	sig_1;
input			clk;
output	[31:0]	sum_0;

reg	[31:0]	sum_0;

always @ (posedge clk)
sum_0 <= ( sig_0 + sig_1) ;


endmodule
