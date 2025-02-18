`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:48 06/09/2008 
// Design Name: 
// Module Name:    iteration_generator 
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
module controller
					(
						start,
						clk,
						address,
						done,
						count
					);

input			start;
input			clk;
output	[5:0]	address;
output			done;
output	[4:0]	count;

reg		[8:0]	iteration;
reg				done;
reg		[4:0]	count;

assign address = iteration[5:0];

always @ (posedge clk)
begin
	if(start)
		count <= 0;
	else if(count == 21)
		count <= 16;
	else 
		count <= count + 1;
end

always @ (posedge clk)
begin
	if(start)
	begin
		iteration <= 0;
		done <= 0;
	end
	else if(iteration == 63)
	begin
		iteration <= 191;
		done <=  1;
	end
	else if(iteration == 191)
	begin
		iteration <= 255;
		done <=  1;
	end
	else if(iteration == 255)
	begin
		iteration <= 319;
		done <=  1;
	end
	
	else if(iteration == 319)
	begin
		iteration <= 383 ;
		done <=  1;
	end
	
	else if(iteration == 383)
	begin
		iteration <= 447 ;
		done <=  1;
	end
	
	else if(iteration == 447)
	begin
		iteration <= iteration ;
		done <=  0;
	end

	else if(count == 15 )
	begin
		iteration <= iteration;
		done <=  0;
	end
	
	else if(count == 16 )
	begin
		iteration <= iteration;
		done <=  0;
	end
	
	else if(count == 17 )
	begin
		iteration <= iteration;
		done <=  0;
	end
	
	else if(count == 18 )
	begin
		iteration <= iteration;
		done <=  0;
	end
	
	else if(count == 19 )
	begin
		iteration <= iteration;
		done <=  0;
	end
	
	else if(count == 20 )
	begin
		iteration <= iteration;
		done <=  0;
	end
	
	else
	begin
		iteration <= iteration + 1;
		done <= 0;
	end
end

endmodule
