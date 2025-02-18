`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:50:47 06/03/2008 
// Design Name: 
// Module Name:    T1 
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
module T1		
		(
			e,
			f,
			g,
			h,
			K,
			W,
			t1
		);

input	[31:0]			e;
input	[31:0]			f;
input	[31:0]			g;
input	[31:0]			h;
input	[31:0]			K;
input	[31:0]			W;
output	[31:0]			t1;

wire		[31:0]			sum_1;
wire		[31:0]			CH;

ch_xyz ch 
		(
		    .x				(e), 
		    .y				(f), 
		    .z				(g), 
		    .CH			(CH)
		);

summation_1 sum1
		(
		    .x_1			(e), 
		    .sum_1			(sum_1)
		    );
		

assign	t1 = 	h + sum_1 + CH + K + W;



endmodule
