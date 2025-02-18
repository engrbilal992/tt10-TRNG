`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:45 06/03/2008 
// Design Name: 
// Module Name:    sigma_0 
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
module sigma_0(
				xg_0,
				sig_0				
				);

input	[31:0] 	xg_0;
output	[31:0]	sig_0;

assign sig_0 = ( { xg_0[6:0] , xg_0[31:7] } ^ { xg_0[17:0] , xg_0[31:18] } ^ { 3'b0 , xg_0[31:3] } ) ;


endmodule
