`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/09 09:03:33
// Design Name: 
// Module Name: enemy_bullet
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


module enemy_bullet(
  input clk_200Hz,
  input clk_5s,
  input rst,
  input [9:0] h_enemy,                           // h_enemy should be 0~640.
  input [9:0] v_enemy,                           // v_enemy should be 0~480.
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  output  [12:0] pixel_addr_bullet_0,
    output  [12:0] pixel_addr_bullet_1,
    output  [12:0] pixel_addr_bullet_2,
    output  [12:0] pixel_addr_bullet_3,
    output  [12:0] pixel_addr_bullet_4
    );  
  wire [9:0] h_bullet_0 ;           
  wire [9:0] v_bullet_0 ;           
  wire [9:0] h_bullet_1 ;           
  wire [9:0] v_bullet_1 ;           
  wire [9:0] h_bullet_2 ;           
  wire [9:0] v_bullet_2 ;           
  wire [9:0] h_bullet_3 ;           
  wire [9:0] v_bullet_3 ;           
  wire [9:0] h_bullet_4 ;           
  wire [9:0] v_bullet_4 ;           
  wire speed;
  
    OnePulse M0(
    .signal_single_pulse(speed),
    .signal(clk_5s),
    .clock(clk_200Hz)
     );
   //  counter_enemy_bullet U0(
   // .clk(clk_200Hz),
   // .speed(speed),
   // .rst(rst),
   // .direction(1),
   // .x_displacement(1),
   // .y_displacement(1),
   // .h_enemy(h_enemy),
   // .v_enemy(v_enemy),
   // .h_bullet(h_bullet_0),
   // .v_bullet(v_bullet_0)
   //  );
   //  counter_enemy_bullet U1(
   // .clk(clk_200Hz),
   // .speed(speed),
   // .rst(rst),
   // .direction(1),
   // .x_displacement(1),
   // .y_displacement(2),
   // .h_enemy(h_enemy),
   // .v_enemy(v_enemy),
   // .h_bullet(h_bullet_1),
   // .v_bullet(v_bullet_1)
   //  );
    counter_enemy_bullet U2(
   .clk(clk_200Hz),
   .speed(speed),
   .rst(rst),
   .direction(1),
   .x_displacement(0),
   .y_displacement(1*2),
   .h_enemy(h_enemy),
   .v_enemy(v_enemy),
   .h_bullet(h_bullet_2),
   .v_bullet(v_bullet_2)
    );
   //  counter_enemy_bullet U3(
   // .clk(clk_200Hz),
   // .speed(speed),
   // .rst(rst),
   // .direction(0),
   // .x_displacement(1),
   // .y_displacement(1),
   // .h_enemy(h_enemy),
   // .v_enemy(v_enemy),
   // .h_bullet(h_bullet_3),
   // .v_bullet(v_bullet_3)
   //  );
   //  counter_enemy_bullet U4(
   // .clk(clk_200Hz),
   // .speed(speed),
   // .rst(rst),
   // .direction(0),
   // .x_displacement(1),
   // .y_displacement(2),
   // .h_enemy(h_enemy),
   // .v_enemy(v_enemy),
   // .h_bullet(h_bullet_4),
   // .v_bullet(v_bullet_4)
   //  );
   //  all_addr_gen A0(
   // .clk(clk_22),
   // .rst(rst),
   // .h_cnt(h_cnt),
   // .v_cnt(v_cnt),
   // .length(16),
   // .height(16),
   // .h_offset(h_bullet_0),
   // .v_offset(v_bullet_0),
   // .pixel_addr(pixel_addr_bullet_0)
   // );     
   // all_addr_gen A1(
   // .clk(clk_22),
   // .rst(rst),
   // .h_cnt(h_cnt),
   // .v_cnt(v_cnt),
   // .length(16),
   // .height(16),
   // .h_offset(h_bullet_1),
   // .v_offset(v_bullet_1),
   // .pixel_addr(pixel_addr_bullet_1)
   // );    
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
   // all_addr_gen A3(
   // .clk(clk_22),
   // .rst(rst),
   // .h_cnt(h_cnt),
   // .v_cnt(v_cnt),
   // .length(16),
   // .height(16),
   // .h_offset(h_bullet_3),
   // .v_offset(v_bullet_3),
   // .pixel_addr(pixel_addr_bullet_3)
   // );                          
   // all_addr_gen A4(
   // .clk(clk_22),
   // .rst(rst),
   // .h_cnt(h_cnt),
   // .v_cnt(v_cnt),
   // .length(16),
   // .height(16),
   // .h_offset(h_bullet_4),
   // .v_offset(v_bullet_4),
   // .pixel_addr(pixel_addr_bullet_4)
   // );                              
endmodule
