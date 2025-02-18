`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:25 06/03/2008 
// Design Name: 
// Module Name:    sigma_1 
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
module sigma_1 (
				xg_1,
				sig_1				
				);

input	[31:0] 	xg_1;
output	[31:0]	sig_1;

assign sig_1 =  ( { xg_1[16:0] , xg_1[31:17] } ^ { xg_1[18:0] , xg_1[31:19] } ^ { 10'b0 , xg_1[31:10] } );


endmodule
