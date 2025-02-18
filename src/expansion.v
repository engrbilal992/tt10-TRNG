`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:23 06/05/2008 
// Design Name: 
// Module Name:    expantion_control_top 
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
module expansion
					(
						M,
						start,
						count,
						clk,
						w_rdy,						
						W
					);


input		[511:0]		M;
input					start;
input		[4:0]		count;
input					clk;
output					w_rdy;						
output		[31:0]	 	W;	

 		
wire			[3:0]	  	address1;					
wire			[3:0]    		address2;					
wire			[31:0]    		data1_to_ram;				
wire			[31:0]    		data2_to_ram;	
wire			[31:0]    		dout1;				
wire			[31:0]    		dout2;				
wire				    		write_en1;					
wire				    		write_en2;	
wire			[31:0]		sig_0;
wire			[31:0]		sig_1;
wire			[31:0]		sum_0;
wire			[31:0]		final_sum;


sigma_0 sig0
			(
				.xg_0				(dout1),
				.sig_0				(sig_0)
			);

sigma_1 sig1 
			(
				.xg_1					(dout2), 
				
				.sig_1					(sig_1)
			);

message_schedule msg_schdl
			(
				.addr1					(address1), 
				.addr2					(address2), 
				.din1						(data1_to_ram), 
				.din2					(data2_to_ram), 
				.we1						(write_en1), 
				.we2						(write_en2), 
				.clk						(clk), 
				.dout1					(dout1), 
				.dout2					(dout2)
			);
			
sum0 sm0 
		(
				.sig_0					(sig_0), 
				.sig_1					(sig_1),
				.clk						(clk),	
				.sum_0					(sum_0)
		);
		
finalsum smfn 
		(
				.sum_0					(sum_0),
				.data1_from_ram			(dout1), 
				.data2_from_ram			(dout2), 
				.clk						(clk),	
				.final_sum					(final_sum)
		);


expansion_controller exp_ctrl (
			    .M					(M), 
			    .start					(start), 
			    .final_sum				(final_sum), 
			    .count					(count), 
			    .clk					(clk), 
			    .w_rdy					(w_rdy), 
			    .W					(W), 
			    .address1				(address1), 
			    .address2				(address2), 
			    .data1_to_ram			(data1_to_ram), 
			    .data2_to_ram			(data2_to_ram), 
			    .write_en1				(write_en1), 
			    .write_en2				(write_en2)			    
			    );
endmodule
