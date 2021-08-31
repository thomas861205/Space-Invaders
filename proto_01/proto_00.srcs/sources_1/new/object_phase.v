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


module object_phase(
	input clk,
	input rst,
	input clk_10Hz,
	input [8:0] rgb_bullet_0,
	input [8:0] rgb_bullet_1,
	input [8:0] rgb_bullet_2,
	input [8:0] rgb_enemy,
	input [8:0] rgb_explosion,
	output [8:0] rgb_out,
	output is_hit
	);

wire hit_enemy;
wire last_phase_en;

hit_detector hit_detector(
    .rgb_bullet_0(rgb_bullet_0),
    .rgb_bullet_1(rgb_bullet_1),
    .rgb_bullet_2(rgb_bullet_2),
    .rgb_enemy(rgb_enemy),
    .default_color(9'b101011010),
    .hit_enemy(hit_enemy)
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
    .en(is_hit),
    .last_phase_en(last_phase_en)
    );

explosion_phase explosion_phase(
    .clk(clk),
    .rst(rst),
    .rgb_enemy(rgb_enemy),
    .rgb_explosion(rgb_explosion),
    .rgb_default(9'b101011010),
    .is_hit(is_hit),
    .last_phase_en(last_phase_en),
    .rgb_out(rgb_out)
    );
endmodule
