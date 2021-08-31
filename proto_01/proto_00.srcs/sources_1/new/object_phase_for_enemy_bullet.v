`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/15 17:17:01
// Design Name: 
// Module Name: object_phase_for_enemy_bullet
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


module object_phase_for_enemy_bullet(
    input [8:0] rgb_bullet,
    input [8:0] default_color,
    input is_hit,
    output [8:0] rgb_out
    );
   
assign rgb_out = is_hit? default_color:rgb_bullet;

endmodule
