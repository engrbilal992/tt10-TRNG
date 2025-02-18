`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:44:54 06/03/2008 
// Design Name: 
// Module Name:    summatin_0 
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
module summatin_0	(
				x,
				sum				
				);

input	[31:0] 	x;
output	[31:0]	sum;
				
assign sum = ( { x[1:0] , x[31:2] } ^ { x[12:0] , x[31:13] } ^ { x[21:0] , x[31:22] } );


endmodule
