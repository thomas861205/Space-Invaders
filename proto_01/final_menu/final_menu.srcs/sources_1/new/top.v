`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/15 20:20:07
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst
    );

wire clk_25MHz;
wire clk_22;
wire [9:0] v_offset_bg;

clk_25MHz clk0(
    .clk(clk),
    .clk1(clk_25MHz),
    .clk22(clk_22)
    );
    
scroll_down bg(
    .clk(clk_22),
    .rst(rst),
    .v_offset(v_offset_bg)
    );
    
bg_addr_gen bg_addr(
    .h_cnt(),
    .v_cnt(),
    .v_offset(),
    .pixel_addr()
    );
blk_mem_gen_0 ip_plane(
	.clka(clk_25MHz),
	.wea(0),
	.addra(pixel_addr_plane),
	.dina(data[11:0]),
	.douta(rgb_plane)
);
endmodule
