`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:31 06/03/2008 
// Design Name: 
// Module Name:    T2 
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
module T2
		(	
			a,
			b,
			c,
			t2		
		);

input	[31:0]			a;
input	[31:0]			b;
input	[31:0]			c;
output	[31:0]			t2;

wire		[31:0]			sum;
wire		[31:0]			MAJ;

maj_xyz maj
		(
		    .x			(a), 
		    .y			(b), 
		    .z			(c), 
		    .MAJ		(MAJ)
		);

summatin_0 sum0
		(
		    .x			(a), 
		    .sum		(sum)
        	);

assign	t2 = sum + MAJ;

endmodule
