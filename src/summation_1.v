`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:29:02 06/03/2008 
// Design Name: 
// Module Name:    summation_1 
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
module summation_1 
				(
					x_1,
					sum_1				
				);

input	[31:0] 	x_1;
output	[31:0]	sum_1;
				
assign sum_1 = ( { x_1[5:0] , x_1[31:6] } ^ { x_1[10:0] , x_1[31:11] } ^ { x_1[24:0] , x_1[31:25] } );


endmodule
