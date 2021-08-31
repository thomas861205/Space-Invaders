`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 12:35:51
// Design Name: 
// Module Name: my_bullet_addr
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


module my_bullet_addr(
	input clk_22,
	input clk_200Hz,
	input rst,
	input [9:0] h_my_plane,       // h_my_plane should be 0~640.
	input [9:0] v_my_plane,       // v_my_plane should be 0~480.
	input [511:0] key_down,
	input [9:0] h_cnt,
	input [9:0] v_cnt,
	output [12:0] pixel_addr_bullet_0,
	output [12:0] pixel_addr_bullet_1,
	output [12:0] pixel_addr_bullet_2
	);

	wire [9:0] h_bullet_0 ;         
	wire [9:0] v_bullet_0 ;         
	wire [9:0] h_bullet_1 ;         
	wire [9:0] v_bullet_1 ;         
	wire [9:0] h_bullet_2 ;         
	wire [9:0] v_bullet_2 ;               
	wire whitespace0;                         
	wire whitespace1;                         
	wire whitespace2;                                                
	wire whitespace0_one;                     
	wire whitespace1_one;                     
	wire whitespace2_one;                                  
	wire keydown;                             
	wire en0,en1,en2,en3,en4;                 
	wire speed;

	one_pulse_space P0(
		.signal_single_pulse(keydown),	//output
		.signal(key_down[41]),			//input
		.clock(clk_200Hz),
		.rst(rst)
		);

	enable J0(
		.clk(clk_200Hz),
		.rst(rst),
		.en0(en0),
		.en1(en1),
		.en2(en2),
		.keydown(keydown),				//input
		.whitespace0(whitespace0),		//output
		.whitespace1(whitespace1),
		.whitespace2(whitespace2)
		);

	OnePulse M0(
		.signal_single_pulse(whitespace0_one),	//output
		.signal(whitespace0),					//input
		.clock(clk_200Hz)
		);

	OnePulse M1(
		.signal_single_pulse(whitespace1_one),
		.signal(whitespace1),
		.clock(clk_200Hz)
		);

	OnePulse M2(
		.signal_single_pulse(whitespace2_one),
		.signal(whitespace2),
		.clock(clk_200Hz)
		);

	counter_bullet U0(
		.clk(clk_200Hz),
		.rst(rst),
		.h_my_plane(h_my_plane),
		.v_my_plane(v_my_plane),
		.whitespace(whitespace0_one),
		.h_bullet(h_bullet_0),
		.v_bullet(v_bullet_0),
		.state(en0)				//output
		);

	counter_bullet U1(
		.clk(clk_200Hz),
		.rst(rst),
		.h_my_plane(h_my_plane),
		.v_my_plane(v_my_plane),
		.whitespace(whitespace1_one),
		.h_bullet(h_bullet_1),
		.v_bullet(v_bullet_1),
		.state(en1)
		);

	counter_bullet U2(
		.clk(clk_200Hz),
		.rst(rst),
		.h_my_plane(h_my_plane),
		.v_my_plane(v_my_plane),
		.whitespace(whitespace2_one),
		.h_bullet(h_bullet_2),
		.v_bullet(v_bullet_2),
		.state(en2)
		);

	all_addr_gen A0(
		.clk(clk_22),
		.rst(rst),
		.h_cnt(h_cnt),
		.v_cnt(v_cnt),
		.length(16),
		.height(16),
		.h_offset(h_bullet_0),
		.v_offset(v_bullet_0),
		.pixel_addr(pixel_addr_bullet_0)
		);

	all_addr_gen A1(
		.clk(clk_22),
		.rst(rst),
		.h_cnt(h_cnt),
		.v_cnt(v_cnt),
		.length(16),
		.height(16),
		.h_offset(h_bullet_1),
		.v_offset(v_bullet_1),
		.pixel_addr(pixel_addr_bullet_1)
		);

	all_addr_gen A2(
		.clk(clk_22),
		.rst(rst),
		.h_cnt(h_cnt),
		.v_cnt(v_cnt),
		.length(16),
		.height(16),
		.h_offset(h_bullet_2),
		.v_offset(v_bullet_2),
		.pixel_addr(pixel_addr_bullet_2)
		);

endmodule
