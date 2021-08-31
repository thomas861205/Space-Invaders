`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 12:50:25
// Design Name: 
// Module Name: object_phase
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


module object_phase_for_plane(
	input clk,
	input clk_1Hz,
	input rst,
	input clk_10Hz,
	input [8:0] rgb_plane,
	input [8:0] rgb_enemy0,
	input [8:0] rgb_enemy1,
	input [8:0] rgb_enemy2,
	input [8:0] rgb_enemy3,
	input [8:0] rgb_enemy4,
	input [8:0] rgb_enemy5,
	input [8:0] rgb_enemy6,
	input [8:0] rgb_enemy7,
	input [8:0] rgb_enemy8,
	input [8:0] rgb_enemy9,
	input [8:0] rgb_enemy0_bullet_2,
	input [8:0] rgb_enemy1_bullet_2,
	input [8:0] rgb_enemy2_bullet_2,
	input [8:0] rgb_enemy3_bullet_2,
	input [8:0] rgb_enemy4_bullet_2,
	input [8:0] rgb_enemy5_bullet_2,
	input [8:0] rgb_enemy6_bullet_2,
	input [8:0] rgb_enemy7_bullet_2,
	input [8:0] rgb_enemy8_bullet_2,
	input [8:0] rgb_enemy9_bullet_2,
	input [8:0] rgb_explosion,
	output [8:0] rgb_out,
	output is_hit,
	output [4:0] hit_times
	);

wire hit_enemy;
wire last_phase_en;
wire is_dead;

assign is_dead = (hit_times==5'd4)? 1:0;

hit_detector_for_plane hit_detector(
    .rgb_plane(rgb_plane),
    .rgb_enemy0(rgb_enemy0),
    .rgb_enemy1(rgb_enemy1),
    .rgb_enemy2(rgb_enemy2),
    .rgb_enemy3(rgb_enemy3),
    .rgb_enemy4(rgb_enemy4),
    .rgb_enemy5(rgb_enemy5),
    .rgb_enemy6(rgb_enemy6),
    .rgb_enemy7(rgb_enemy7),
    .rgb_enemy8(rgb_enemy8),
    .rgb_enemy9(rgb_enemy9),
    .rgb_enemy0_bullet_2(rgb_enemy0_bullet_2),
    .rgb_enemy1_bullet_2(rgb_enemy1_bullet_2),//
    .rgb_enemy2_bullet_2(rgb_enemy2_bullet_2),//
    .rgb_enemy3_bullet_2(rgb_enemy3_bullet_2),//
    .rgb_enemy4_bullet_2(rgb_enemy4_bullet_2),//
    .rgb_enemy5_bullet_2(rgb_enemy5_bullet_2),//
    .rgb_enemy6_bullet_2(rgb_enemy6_bullet_2),//
    .rgb_enemy7_bullet_2(rgb_enemy7_bullet_2),//
    .rgb_enemy8_bullet_2(rgb_enemy8_bullet_2),//
    .rgb_enemy9_bullet_2(rgb_enemy9_bullet_2),//
    .default_color(9'b101011010),
    .hit_enemy(hit_enemy)
    );
    
hit_time_counter hit_counter(
    .clk(clk_1Hz),
    .rst(rst),
    .hit(hit_enemy),
    .hit_times(hit_times)
    );
    
permanent_en fsm_is_hit(
    .clk(clk),
    .rst(rst),
    .hit_plane(hit_enemy),
    .is_hit(is_hit)
    );

explosion_latency cnt(
    .clk(clk_10Hz),
    .rst(rst),
    .en(is_hit && is_dead),
    .last_phase_en(last_phase_en)
    );

explosion_phase explosion_phase(
    .clk(clk),
    .rst(rst),
    .rgb_enemy(rgb_plane),
    .rgb_explosion(rgb_explosion),
    .rgb_default(9'b101011010),
    .is_hit(is_hit && is_dead),
    .last_phase_en(last_phase_en),
    .rgb_out(rgb_out)
    );
endmodule
