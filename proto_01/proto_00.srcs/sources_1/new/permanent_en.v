`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 11:34:47
// Design Name: 
// Module Name: permanent_en
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module permanent_en(
	input clk,
	input rst,
	input hit_plane,
	output is_hit
	);

reg state;
reg next_state;

assign is_hit=state;

always@(posedge clk or posedge rst) begin
	if (rst) begin
		state <= 0;
	end
	else begin
		state <= next_state;
	end
end

always@(*) begin
	case(state)
	
	0:
	begin
		if (hit_plane) begin
			next_state <= 1;
		end
		else begin
			next_state <= 0;
		end
	end
	
	1:
	begin
		next_state <= 1;
	end
	
	default:
	begin
		next_state <= 0;
	end
	
	endcase
end
endmodule
