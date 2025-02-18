`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:37:25 06/05/2008 
// Design Name: 
// Module Name:    constants 
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
module constants(
				address,
				clk,
				dout
			);

input	[5:0]		address;
input				clk;
output	[31:0]		dout;

reg		[31:0]		dout;
reg		[31:0]		ROM		[0:63];

always@(posedge clk)
begin
	dout <= ROM[address];
end

initial
begin
	ROM[0] = 32'h428a2f98;
	ROM[1] = 32'h71374491;
	ROM[2] = 32'hb5c0fbcf;
	ROM[3] = 32'he9b5dba5;
	ROM[4] = 32'h3956c25b;
	ROM[5] = 32'h59f111f1;
	ROM[6] = 32'h923f82a4;
	ROM[7] = 32'hab1c5ed5;
	ROM[8] = 32'hd807aa98;
	ROM[9] = 32'h12835b01;
	ROM[10] = 32'h243185be;
	ROM[11] = 32'h550c7dc3;
	ROM[12] = 32'h72be5d74;
	ROM[13] = 32'h80deb1fe;
	ROM[14] = 32'h9bdc06a7;
	ROM[15] = 32'hc19bf174;
	ROM[16] = 32'he49b69c1;
	ROM[17] = 32'hefbe4786;
	ROM[18] = 32'h0fc19dc6;
	ROM[19] = 32'h240ca1cc;
	ROM[20] = 32'h2de92c6f;
	ROM[21] = 32'h4a7484aa;
	ROM[22] = 32'h5cb0a9dc;
	ROM[23] = 32'h76f988da;
	ROM[24] = 32'h983e5152;
	ROM[25] = 32'ha831c66d;
	ROM[26] = 32'hb00327c8;
	ROM[27] = 32'hbf597fc7;
	ROM[28] = 32'hc6e00bf3;
	ROM[29] = 32'hd5a79147;
	ROM[30] = 32'h06ca6351;
	ROM[31] = 32'h14292967;
	ROM[32] = 32'h27b70a85;
	ROM[33] = 32'h2e1b2138;
	ROM[34] = 32'h4d2c6dfc;
	ROM[35] = 32'h53380d13;
	ROM[36] = 32'h650a7354;
	ROM[37] = 32'h766a0abb;
	ROM[38] = 32'h81c2c92e;
	ROM[39] = 32'h92722c85;
	ROM[40] = 32'ha2bfe8a1;
	ROM[41] = 32'ha81a664b;
	ROM[42] = 32'hc24b8b70;
	ROM[43] = 32'hc76c51a3;
	ROM[44] = 32'hd192e819;
	ROM[45] = 32'hd6990624;
	ROM[46] = 32'hf40e3585;
	ROM[47] = 32'h106aa070;
	ROM[48] = 32'h19a4c116;
	ROM[49] = 32'h1e376c08;
	ROM[50] = 32'h2748774c;
	ROM[51] = 32'h34b0bcb5;
	ROM[52] = 32'h391c0cb3;
	ROM[53] = 32'h4ed8aa4a;
	ROM[54] = 32'h5b9cca4f;
	ROM[55] = 32'h682e6ff3;
	ROM[56] = 32'h748f82ee;
	ROM[57] = 32'h78a5636f;
	ROM[58] = 32'h84c87814;
	ROM[59] = 32'h8cc70208;
	ROM[60] = 32'h90befffa;
	ROM[61] = 32'ha4506ceb;
	ROM[62] = 32'hbef9a3f7;
	ROM[63] = 32'hc67178f2;
end

endmodule
