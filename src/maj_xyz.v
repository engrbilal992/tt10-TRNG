`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:31:36 06/03/2008 
// Design Name: 
// Module Name:    maj_xyz 
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

//===========================================================================================

module maj_xyz	( 
					x,
					y,
					z,
					MAJ
				);

//===========================================================================================

input	[31:0]			x;
input	[31:0]			y;
input	[31:0]			z;
output	[31:0]			MAJ;

//===========================================================================================

assign	MAJ = ( (x & y) ^ (x & z) ^ (y & z) );

//--------------------------------------------------------------------------------------------------------

endmodule
