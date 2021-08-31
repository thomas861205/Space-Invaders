`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/09 07:31:55
// Design Name: 
// Module Name: hit_detector_for_plane
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


module hit_detector_for_plane(
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
    input [8:0] rgb_plane,
    input [8:0] rgb_enemy0_bullet_2,
    input [8:0] rgb_enemy1_bullet_2,//
    input [8:0] rgb_enemy2_bullet_2,//
    input [8:0] rgb_enemy3_bullet_2,//
    input [8:0] rgb_enemy4_bullet_2,//
    input [8:0] rgb_enemy5_bullet_2,//
    input [8:0] rgb_enemy6_bullet_2,//
    input [8:0] rgb_enemy7_bullet_2,//
    input [8:0] rgb_enemy8_bullet_2,//
    input [8:0] rgb_enemy9_bullet_2,//
    input [8:0] default_color,
    output reg hit_enemy
    );


always @(*) begin
	if (rgb_plane!=default_color) begin
		if (rgb_enemy0!=default_color ||
		    rgb_enemy1!=default_color ||
		    rgb_enemy2!=default_color ||
		    rgb_enemy3!=default_color ||
		    rgb_enemy4!=default_color ||
		    rgb_enemy5!=default_color ||
		    rgb_enemy6!=default_color ||
		    rgb_enemy7!=default_color ||
		    rgb_enemy8!=default_color ||
		    rgb_enemy9!=default_color ||
		    rgb_enemy0_bullet_2!=default_color ||
		    rgb_enemy1_bullet_2!=default_color ||//
		    rgb_enemy2_bullet_2!=default_color ||//
		    rgb_enemy3_bullet_2!=default_color ||//
		    rgb_enemy4_bullet_2!=default_color ||//
		    rgb_enemy5_bullet_2!=default_color ||//
		    rgb_enemy6_bullet_2!=default_color ||//
		    rgb_enemy7_bullet_2!=default_color ||//
		    rgb_enemy8_bullet_2!=default_color ||//
		    rgb_enemy9_bullet_2!=default_color//
		    ) begin
			hit_enemy = 1;
		end
		else begin
			hit_enemy = 0;
		end
	end
	else begin
		hit_enemy = 0;
	end
end
endmodule
