`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 08:29:08
// Design Name: 
// Module Name: hit_detector
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


module hit_detector(
//    input [8:0] rgb_plane,
    input [8:0] rgb_bullet_0,
    input [8:0] rgb_bullet_1,
    input [8:0] rgb_bullet_2,
    input [8:0] rgb_enemy,
    input [8:0] default_color,
    output reg hit_enemy
    );


always @(*) begin
	if (rgb_enemy!=default_color ) begin
		if (rgb_bullet_0!=default_color ||
		    rgb_bullet_1!=default_color ||
		    rgb_bullet_2!=default_color) begin
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
