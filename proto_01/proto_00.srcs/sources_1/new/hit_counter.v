`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/01 00:39:15
// Design Name: 
// Module Name: hit_counter
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


module hit_counter(
    input is_hit_0,
    input is_hit_1,
    input is_hit_2,
    input is_hit_3,
    input is_hit_4,
    input is_hit_5,
    input is_hit_6,//
    input is_hit_7,//
    input is_hit_8,//
    input is_hit_9,//
    output [13:0] score
    );

assign score=is_hit_0*100
            +is_hit_1*100
            +is_hit_2*100
            +is_hit_3*100
            +is_hit_4*100
            +is_hit_5*100
            +is_hit_6*100//
            +is_hit_7*100//
            +is_hit_8*100//
            +is_hit_9*100;//
endmodule
