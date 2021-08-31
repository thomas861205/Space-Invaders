`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/09 10:31:31
// Design Name: 
// Module Name: object_phase_for_bullet
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


module object_phase_for_bullet(
    input [8:0] rgb_bullet,
    input [8:0] default_color,
    input [4:0] hit_times,
    input is_hit,
    output [8:0] rgb_out
    );
wire is_dead;
    
assign is_dead = (hit_times==5'd4)? 1:0;    
assign rgb_out = (is_hit && is_dead)? default_color:rgb_bullet;

endmodule
