`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/15 11:35:34
// Design Name: 
// Module Name: horizental_shift
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


module horizental_shift(
	input clk,
	input rst,
	input [9:0] h_initial,
	input [9:0] v_initial,
	output reg [9:0] h_offset,
	output [9:0] v_offset
	);

reg h_direction;	//0->left, 1->right
reg v_direction;	//0->down, 1->up
wire [9:0] length;

assign length = 16;
assign v_offset = v_initial;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		h_offset <= h_initial;
		h_direction <= 1;
	end
	else if (h_offset == 319-16)  begin
		h_direction <= 0;
		h_offset <= h_offset - 1;
	end
	else if (h_offset == 0) begin
		h_direction <= 1;
		h_offset <= 1;
	end
	else if (h_direction == 1) begin
		h_offset <= h_offset + 1;
	end
	else if (h_direction == 0)begin
		h_offset <= h_offset - 1;
	end
	else begin
		h_offset <= h_initial;
	end
end
endmodule
