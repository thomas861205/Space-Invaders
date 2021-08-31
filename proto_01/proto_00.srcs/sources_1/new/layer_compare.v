`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/26 09:51:19
// Design Name: 
// Module Name: layer_compare
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


module layer_compare(
	input [8:0] rgb_plane,
	input [8:0] rgb_bullet_0,
	input [8:0] rgb_bullet_1,
	input [8:0] rgb_bullet_2,
	input [8:0] rgb_bg,
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
	output reg [8:0] pixel_out
	);

always @(*) begin
	if (rgb_enemy0!=default_color)
	   pixel_out = rgb_enemy0;

	else if (rgb_enemy1!=default_color)
	   pixel_out = rgb_enemy1;

	else if (rgb_enemy2!=default_color)
       pixel_out = rgb_enemy2;

	else if (rgb_enemy3!=default_color)
       pixel_out = rgb_enemy3;

	else if (rgb_enemy4!=default_color)
       pixel_out = rgb_enemy4;

	else if (rgb_enemy5!=default_color)
       pixel_out = rgb_enemy5;

	else if (rgb_enemy6!=default_color)
       pixel_out = rgb_enemy6;

	else if (rgb_enemy7!=default_color)
       pixel_out = rgb_enemy7;

	else if (rgb_enemy8!=default_color)
       pixel_out = rgb_enemy8;

	else if (rgb_enemy9!=default_color)
       pixel_out = rgb_enemy9;

    else if (rgb_plane!=default_color)
       pixel_out = rgb_plane;

	else if (rgb_bullet_0!=default_color)
	   pixel_out = rgb_bullet_0;

	else if (rgb_bullet_1!=default_color)
	   pixel_out = rgb_bullet_1;

	else if (rgb_bullet_2!=default_color)
	   pixel_out = rgb_bullet_2;

	else if (rgb_enemy0_bullet_2!=default_color)
	   pixel_out = rgb_enemy0_bullet_2;

	else if (rgb_enemy1_bullet_2!=default_color)//
	   pixel_out = rgb_enemy1_bullet_2;

	else if (rgb_enemy2_bullet_2!=default_color)//
	   pixel_out = rgb_enemy2_bullet_2;

	else if (rgb_enemy3_bullet_2!=default_color)//
	   pixel_out = rgb_enemy3_bullet_2;

	else if (rgb_enemy4_bullet_2!=default_color)//
	   pixel_out = rgb_enemy4_bullet_2;

	else if (rgb_enemy5_bullet_2!=default_color)//
	   pixel_out = rgb_enemy5_bullet_2;

	else if (rgb_enemy6_bullet_2!=default_color)//
	   pixel_out = rgb_enemy6_bullet_2;

	else if (rgb_enemy7_bullet_2!=default_color)//
	   pixel_out = rgb_enemy7_bullet_2;

	else if (rgb_enemy8_bullet_2!=default_color)//
	   pixel_out = rgb_enemy8_bullet_2;
	   
	else if (rgb_enemy9_bullet_2!=default_color)//
	   pixel_out = rgb_enemy9_bullet_2;

	else
	   pixel_out = rgb_bg;
end
endmodule