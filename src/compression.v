`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:55 06/03/2008 
// Design Name: 
// Module Name:    compression 
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
module compression
				(
					start,
					K,
					W,
					w_rdy,
					count,
					done,
					clk,
					hash_rdy,
					HASH
				);

//===========================================================================================

input				start;
input	[31:0]		K;
input	[31:0]		W;
input				w_rdy;
input	[4:0]		count;
input				done;
input				clk;
wire	[31:0]		a;
wire	[31:0]		b;
wire	[31:0]		c;
wire	[31:0]		e;
wire	[31:0]		f;
wire	[31:0]		g;
wire	[31:0]		h;
output				hash_rdy;
output	[255:0]		HASH;

//===========================================================================================

wire		[31:0]		t1;
wire		[31:0]		t2;

//===========================================================================================

T1 t_1
				(	
					.e					(e), 
					.f					(f), 
					.g					(g), 
					.h					(h), 
					.K					(K), 
					.W					(W), 
					.t1					(t1)
				 );

T2 t_2
				(
					.a					(a), 
					.b					(b), 
					.c					(c), 
					.t2					(t2)
				 );


hash_generator hash_gen 
				(
					.t1					(t1), 
					.t2					(t2),
					.count				(count),
					.w_rdy				(w_rdy),
					.done				(done),
					.clk					(clk), 
					.start				(start), 
					.a					(a), 
					.b					(b), 
					.c					(c), 
					.e					(e), 
					.f					(f), 
					.g					(g), 
					.h					(h),
					.hash_rdy				(hash_rdy),
					.HASH				(HASH)
				    );

//--------------------------------------------------------------------------------------------------------
endmodule

//===========================================================================================
