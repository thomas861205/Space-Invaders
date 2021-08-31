`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/16 00:27:02
// Design Name: 
// Module Name: stablizer
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


module stablizer(
	input clk,
	input rst,
	input [9:0] h_initial,
	input [9:0] v_initial,
	output [9:0] h_offset,
	output [9:0] v_offset
	);

reg h_direction;	//0->left, 1->right
reg v_direction;	//0->down, 1->up
wire [9:0] length;

assign length = 16;
assign v_offset = v_initial;
assign h_offset = h_initial;
endmodule
