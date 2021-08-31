`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 08:52:50
// Design Name: 
// Module Name: fsm_for_hit_
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


module explosion_phase(
	input clk,
	input rst,
	input [8:0] rgb_enemy,
	input [8:0] rgb_explosion,
	input [8:0] rgb_default,
	input is_hit,
	input last_phase_en,
	output reg [8:0] rgb_out
	);

reg [1:0] state;
reg [1:0] next_state;

always@(posedge clk or posedge rst) begin
	if (rst) begin
		state <= 2'b0;
	end
	else begin
		state <= next_state;
	end
end

always@(*) begin
	case(state)
	2'b0:
	begin
		if (is_hit) begin
			next_state <= 2'b1;
			rgb_out <= rgb_explosion;
		end
		else begin
			next_state <= 2'b0;
			rgb_out <= rgb_enemy;
		end
	end
	2'b1:
	begin
		if (last_phase_en) begin
			next_state <= 2'b10;
			rgb_out <= rgb_default;
		end
		else begin
			next_state <= 2'b1;
			rgb_out <= rgb_explosion;
		end
	end
	2'b10:
	begin
		next_state <= 2'b10;
		rgb_out <= rgb_default;
	end
	default:
	begin
		next_state <= 2'b0;
		rgb_out <= rgb_enemy;
	end
	endcase
end
endmodule
