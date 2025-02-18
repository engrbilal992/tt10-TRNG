`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:29:54 06/04/2008 
// Design Name: 
// Module Name:    RAM 
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
module message_schedule
(
				addr1,
				addr2,
				din1,
				din2,
				we1,
				we2,
				clk,
				dout1,
				dout2
			);
			
input		[3:0]		addr1;
input		[3:0]		addr2;
input		[31:0]		din1;
input		[31:0]		din2;
input					we1;
input					we2;
input					clk;
output		[31:0]		dout1;
output		[31:0]		dout2;

reg			[31:0]		dout1;
reg			[31:0]		dout2;
reg			[31:0]		RAM		[0:15];

//===========================================================================================

//------------------------------------- port 1 ----------------------------------------------------------

always@(posedge clk) 
begin
	if (we1)
		RAM[addr1] <= din1;
	
	dout1 <= RAM[addr1];
end

//------------------------------------- port 2 ----------------------------------------------------------

always@(posedge clk) 
begin
	if (we2)
		RAM[addr2] <= din2;
	
	dout2 <= RAM[addr2];
end


endmodule

//===========================================================================================
