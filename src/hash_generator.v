`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:13 06/09/2008 
// Design Name: 
// Module Name:    intermediate_result 
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
module hash_generator
					(
						t1,
						t2,
						count,
						w_rdy,
						done,
						clk,
						start,
						a,
						b,
						c,
						e,
						f,
						g,
						h,
						hash_rdy,
						HASH
					);
					

input		[31:0]		t1;
input		[31:0]		t2;
input					w_rdy;
input					clk;
input		[4:0]		count;
input					start;

input					done;

output		[31:0]		a;
output		[31:0]		b;
output		[31:0]		c;
output		[31:0]		e;
output		[31:0]		f;
output		[31:0]		g;
output		[31:0]		h;

output					hash_rdy;
output		[255:0]		HASH;



reg			[31:0]		a;
reg			[31:0]		b;
reg			[31:0]		c;
reg			[31:0]		d;
reg			[31:0]		e;
reg			[31:0]		f;
reg			[31:0]		g;
reg			[31:0]		h;

reg						hash_rdy;
reg			[4:0]		temp;


always @ (posedge clk)
begin
if(! done)
	begin
	temp <= 5'b0;
	end
else
begin
	temp <= temp << 1;
	temp[0] <= done;
	
end
end



always@(posedge clk)
begin
	if(start)
	begin
		a <= 32'h0;
		b <= 32'h0;
		c <= 32'h0;
		d <= 32'h0;
		e <= 32'h0;
		f <= 32'h0;
		g <= 32'h0;
		h <= 32'h0;
		hash_rdy <= 0;
	end
	else if(count == 0)
	begin
		a <= 32'h6a09e667;
		b <= 32'hbb67ae85;
		c <= 32'h3c6ef372;
		d <= 32'ha54ff53a;
		e <= 32'h510e527f;
		f <= 32'h9b05688c;
		g <= 32'h1f83d9ab;
		h <= 32'h5be0cd19;
		hash_rdy <= 0;
	end
	else if (w_rdy==1)
	begin
		h <= g;
		g <= f;
		f <= e;
		e <= d + t1;
		d <= c;
		c <= b;
		b <= a;
		a <= t1 + t2;
		hash_rdy <= 0;
	end
	else if (temp[4])
	begin
		a <= a + 32'h6a09e667;
		b <= b + 32'hbb67ae85;
		c <= c + 32'h3c6ef372;
		d <= d + 32'ha54ff53a;
		e <= e + 32'h510e527f;
		f <= f + 32'h9b05688c;
		g <= g + 32'h1f83d9ab;
		h <= h + 32'h5be0cd19;
		hash_rdy <= 1;
	end
end

assign	HASH = {a,b,c,d,e,f,g,h};

endmodule
