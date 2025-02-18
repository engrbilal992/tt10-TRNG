`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:22 06/25/2008 
// Design Name: 
// Module Name:    expansion_test 
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
module expansion_controller
			(
				M,
				start,
				final_sum,
				count,
				clk,
				w_rdy,
				W,
				address1,
				address2,
				data1_to_ram,
				data2_to_ram,
				write_en1,
				write_en2
			);

input	[511:0]	M;
input			start;
input	[31:0]	final_sum;
input	[4:0]	count;
input			clk;
output			w_rdy;
output	[31:0]	W;
output	[3:0]	address1;
output	[3:0]	address2;
output	[31:0]	data1_to_ram;
output	[31:0]	data2_to_ram;
output			write_en1;
output			write_en2;


reg				w_rdy;
reg		[31:0]	W;
reg		[3:0]	j; 
reg		[3:0]	j_2;
reg		[3:0]	j_7;
reg		[3:0]	j_15;
reg		[3:0]	address1;
reg		[3:0]	address2;
reg		[31:0]	data1_to_ram;
reg		[31:0]	data2_to_ram;
reg				write_en1;
reg				write_en2;
reg		[31:0]	sum;

always @ (posedge clk)	    
begin
	if(start)
	begin
		address1 <= 0;
		address2 <= 0;
		data1_to_ram <= 0;
		data2_to_ram <= 0;
		write_en1 <= 1;
		write_en2 <= 0;
		 sum <= 0;
		j <= 4'b0;
		j_2 <= 4'd14;
		j_7 <= 4'd9;
		j_15 <= 4'd1;
		W <= 0;
		w_rdy <= 1;
	end
	
	else
	begin
		case(count)
		0:	begin
				address1 <= 0;
				address2 <= 0;
				data1_to_ram <= M[511:480];
				data2_to_ram <= 0; 
				write_en1 <= 1;
				write_en2 <= 0;
				sum <= sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <=  M[511:480];
				w_rdy <= 1;
			end
		1:	begin
				address1 <= 1;
				address2 <= 0;
				data1_to_ram <= M[479:448];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <= sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <=M[479:448];
				w_rdy <= 1;
			end
		2:	begin
				address1 <= 2;
				address2 <= 0;
				data1_to_ram <= M[447:416];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <= sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[447:416];
				w_rdy <= 1;
			end
		3:	begin
				address1 <= 3;
				address2 <=0;
				data1_to_ram <= M[415:384];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <=  sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[415:384];
				w_rdy <= 1;
			end
		4:	begin
				address1 <= 4;
				address2 <= 0;
				data1_to_ram <= M[383:352];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				  sum <=  sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[383:352];
				w_rdy <= 1;
			end
		5:	begin
				address1 <= 5;
				address2 <= 0;
				data1_to_ram <=M[351:320] ;
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				  sum <=  sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[351:320];
				w_rdy <= 1;
			end
		6:	begin
				address1 <= 6;
				address2 <= 0;
				data1_to_ram <= M[319:288];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				  sum <= sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[319:288];
				w_rdy <= 1;
			end
		7:	begin
				address1 <= 7;
				address2 <= 0;
				data1_to_ram <= M[287:256];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				  sum <=  sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[287:256];
				w_rdy <= 1;
			end
		8:	begin
				address1 <= 8;
				address2 <= 0;
				data1_to_ram <=  M[255:224];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				  sum <= sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[255:224];
				w_rdy <= 1;
			end	
		9:	begin
				address1 <= 9;
				address2 <= 0;
				data1_to_ram <=M[223:192];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <=  sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[223:192];
				w_rdy <= 1;
			end	
		10:	begin
				address1 <= 10;
				address2 <= 0;
				data1_to_ram <= M[191:160];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <=  sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[191:160];
				w_rdy <= 1;
			end			
		11:	begin
				address1 <= 11;
				address2 <= 0;
				data1_to_ram <= M[159:128];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <=  sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[159:128];
				w_rdy <= 1;
			end	
		12:	begin
				address1 <= 12;
				address2 <= 0;
				data1_to_ram <=M[127:96] ;
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <= sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <=M[127:96];
				w_rdy <= 1;
			end		
		13:	begin
				address1 <= 13;
				address2 <= 0;
				data1_to_ram <= M[95:64];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <= sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[95:64] ;
				w_rdy <= 1;
			end	
		14:	begin
				address1 <= 14;
				address2 <= 0;
				data1_to_ram <= M[63:32];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <= sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[63:32];
				w_rdy <= 1;
			end	
		15:	begin
				address1 <= 15;
				address2 <= 0;
				data1_to_ram <= M[31:0];
				data2_to_ram <= 0;
				write_en1 <= 1;
				write_en2 <= 0;
				sum <=  sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= M[31:0];
				w_rdy <= 0;
			end	
	
		16:	begin
				address1 <= j_15 ;		//==> 14
				address2 <=j_2  ;		//==> 1
				data1_to_ram <= 0;
				data2_to_ram <= 0;
				write_en1 <= 0;
				write_en2 <= 0;
				sum <= final_sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <=W;
				w_rdy <= 0;
			end
		17:	begin
				address1 <= j;			//==> 0
				address2 <= j_7;		//==> 9		
				data1_to_ram <= 0;
				data2_to_ram <= 0;
				write_en1 <= 0;			
				write_en2 <= 0;
				sum <= final_sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <=W;	
				w_rdy <= 0;
			end
		18:	begin
				address1 <= j;
				address2 <= address2;
				data1_to_ram <= 0;
				data2_to_ram <= 0;
				write_en1 <= 0;  	
				write_en2 <= 0;
				sum <=  final_sum;
				j <= j+1;
				j_2 <= j_2+1;
				j_7 <= j_7+1;
				j_15 <= j_15+1;
				W <= W;
				w_rdy <= 0;
			end
		19:	begin
				address1 <= address1 ;		
				address2 <=address2  ;		
				data1_to_ram <= 0;
				data2_to_ram <= 0;
				write_en1 <= 0;		
				write_en2 <= 0;
				sum <=  final_sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= W;
				w_rdy <= 0;
			end	
		20:	begin
				address1 <= address1 ;		
				address2 <=address2  ;		
				data1_to_ram <= final_sum;
				data2_to_ram <= 0;
				write_en1 <= 1;		
				write_en2 <= 0;
				sum <= final_sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= W;
				w_rdy <= 1;
			end	
		21:	begin
				address1 <= address1 ;		
				address2 <=address2  ;		
				data1_to_ram <= final_sum;
				data2_to_ram <= 0;
				write_en1 <= 0;		
				write_en2 <= 0;
				sum <=  final_sum;
				j <= j;
				j_2 <= j_2;
				j_7 <= j_7;
				j_15 <= j_15;
				W <= sum;
				w_rdy <= 0;
			end
		
		endcase 
	end	
end    
endmodule

