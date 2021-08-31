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
  input [9:0] h_my_plane,
  input [9:0] v_my_plane,
  input [511:0] key_down,
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  output reg [12:0] pixel_addr_bullet_0,
  output reg [12:0] pixel_addr_bullet_1,
  output reg [12:0] pixel_addr_bullet_2,
  output reg [12:0] pixel_addr_bullet_3,
  output reg [12:0] pixel_addr_bullet_4
   );
   
   wire whitespace0;                         
   wire whitespace1;                         
   wire whitespace2;                         
   wire whitespace3;                         
   wire whitespace4;                         
   wire whitespace0_one;                     
   wire whitespace1_one;                     
   wire whitespace2_one;                     
   wire whitespace3_one;                     
   wire whitespace4_one;                     
   wire keydown;                             
   wire en0,en1,en2,en3,en4;                 
   wire speed;    
   // enable's function is to decide which bullet should be able to be fired.
   // keydown is the onepulse of key_down[41](meaning is the whitespace on the keyboard is pressed .). 
   enable(                                                            
   .clk(clk_200Hz),                                                        
   .rst(rst),                                                         
   .en0(en0),                                                         
   .en1(en1),                                                         
   .en2(en2),                                                         
   .en3(en3),                                                         
   .en4(en4),                                                         
   .keydown(keydown),                                                 
   .whitespace0(whitespace0),                                         
   .whitespace1(whitespace1),                                         
   .whitespace2(whitespace2),                                         
   .whitespace3(whitespace3),                                         
   .whitespace4(whitespace4)                                          
   );
   // one_pulse_space can deal with the case which the space is pressed in long time.
   one_pulse_space P0(                                               
   .signal_single_pulse(keydown),                                    
   .signal(key_down[41]),                                            
   .clock(clk_200Hz),                                                     
   .rst(rst)                                                         
   ); 
   // OnePulse's function is to transfer the whitespace signal from level to edge.
   OnePulse M0(                                                       
   .signal_single_pulse(whitespace0_one),                            
   .signal(whitespace0),                                             
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
   OnePulse M3(                                                      
   .signal_single_pulse(whitespace3_one),                            
   .signal(whitespace3),                                             
   .clock(clk_200Hz)                                                      
   );                                                                
   OnePulse M4(                                                      
   .signal_single_pulse(whitespace4_one),                            
   .signal(whitespace4),                                             
   .clock(clk_200Hz)                                                      
   ); 
   // counter_bullet' function is to locate the bullet.                                                              
   counter_bullet U0(                                                 
  .clk(clk_200Hz),                                                         
  .rst(rst),                                                          
  .h_my_plane(h_my_plane),                                            
  .v_my_plane(v_my_plane),                                            
  .whitespace(whitespace0_one),                                       
  .h_bullet(h_bullet_0),                                              
  .v_bullet(v_bullet_0),                                              
  .state(en0)                                                         
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
   counter_bullet U3(                                                 
  .clk(clk_200Hz),                                                         
  .rst(rst),                                                          
  .h_my_plane(h_my_plane),                                            
  .v_my_plane(v_my_plane),                                            
  .whitespace(whitespace3_one),                                       
  .h_bullet(h_bullet_3),                                              
  .v_bullet(v_bullet_3),                                              
  .state(en3)                                                         
   );                                                                 
   counter_bullet U4(                                                 
  .clk(clk_200Hz),                                                         
  .rst(rst),                                                          
  .h_my_plane(h_my_plane),                                            
  .v_my_plane(v_my_plane),                                            
  .whitespace(whitespace4_one),                                       
  .h_bullet(h_bullet_4),                                              
  .v_bullet(v_bullet_4),                                              
  .state(en4)                                                         
   );    
   // all_addr_gen is to find the address of bullet.
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
   all_addr_gen A3(
   .clk(clk_22),
   .rst(rst),
   .h_cnt(h_cnt),
   .v_cnt(v_cnt),
   .length(16),
   .height(16),
   .h_offset(h_bullet_3),
   .v_offset(v_bullet_3),
   .pixel_addr(pixel_addr_bullet_3)
   );                          
   all_addr_gen A4(
   .clk(clk_22),
   .rst(rst),
   .h_cnt(h_cnt),
   .v_cnt(v_cnt),
   .length(16),
   .height(16),
   .h_offset(h_bullet_4),
   .v_offset(v_bullet_4),
   .pixel_addr(pixel_addr_bullet_4)
   );                                     
endmodule
