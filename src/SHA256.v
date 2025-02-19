//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:50:40 06/05/2008 
// Design Name: 
// Module Name:    hash_computation 
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
module SHA256
					(
						M,
						start,
						clk,
						HASH,
						hash_rdy 
					);


input		[511:0]		M;
input					start;
input					clk;
output		[255:0]		HASH;
output					hash_rdy;

wire			[31:0]		W;
wire			[31:0]		K;
wire						start;
wire			[5:0]		connect;
wire			[4:0]		count;
wire						w_rdy;
wire						done;


constants const_inst 
			(
			    .address				(connect), 
			    .clk					(clk), 
			    .dout					(K)
			);

expansion expand			
			(
				.M					(M),
				.start				(start),
				.count				(count), 		
				.clk					(clk),
				.w_rdy				(w_rdy),								
				.W					(W)
			);

controller control
			(
				.start				(start), 
				.clk					(clk), 
				.address				(connect),
				.done				(done),
				.count				(count)
			);


compression compress 
			(
			    .start					(start),
			    .K						(K), 
			    .W					(W), 
			    .w_rdy					(w_rdy),
			    .done					(done),
			    .count					(count),
			    .clk					(clk),
			    .hash_rdy				(hash_rdy),
			    .HASH					(HASH)
			);


endmodule
