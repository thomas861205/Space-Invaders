`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/26 07:57:36
// Design Name: 
// Module Name: top
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


module top(
   input clk,
   input rst,
   input switch0,
   input switch1,
   inout PS2_DATA,
   inout PS2_CLK,
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   output hsync,
   output vsync,
   output [3:0] four,
   output [7:0] ssd,
   output [15:0] led
    );
    
    wire clk_1Hz;
    wire clk_10Hz;
    wire clk_100Hz;
    wire clk_200Hz;
    wire clk_5s;
    wire [8:0] last_change;
    wire [511:0] key_down;
    wire key_valid;
    wire [11:0] data;
    wire clk_25MHz;
    wire clk_22;

    wire [16:0] pixel_addr_menu;
    wire [16:0] pixel_addr_gameover;
    wire [16:0] pixel_addr_clear;
    wire [16:0] pixel_addr_bg;
    wire [12:0] pixel_addr_plane;
    wire [12:0] pixel_addr_bullet_0;//plane
    wire [12:0] pixel_addr_bullet_1;//plane
    wire [12:0] pixel_addr_bullet_2;//plane
    wire [12:0] pixel_addr_enemy0;
    wire [12:0] pixel_addr_enemy1;
    wire [12:0] pixel_addr_enemy2;
    wire [12:0] pixel_addr_enemy3;
    wire [12:0] pixel_addr_enemy4;
    wire [12:0] pixel_addr_enemy5;
    wire [12:0] pixel_addr_enemy6;
    wire [12:0] pixel_addr_enemy7;
    wire [12:0] pixel_addr_enemy8;
    wire [12:0] pixel_addr_enemy9;
    wire [12:0] pixel_addr_enemy0_bullet_2;
    wire [12:0] pixel_addr_enemy1_bullet_2;//
    wire [12:0] pixel_addr_enemy2_bullet_2;//
    wire [12:0] pixel_addr_enemy3_bullet_2;//
    wire [12:0] pixel_addr_enemy4_bullet_2;//
    wire [12:0] pixel_addr_enemy5_bullet_2;//
    wire [12:0] pixel_addr_enemy6_bullet_2;//
    wire [12:0] pixel_addr_enemy7_bullet_2;//
    wire [12:0] pixel_addr_enemy8_bullet_2;//
    wire [12:0] pixel_addr_enemy9_bullet_2;//


    wire [8:0] rgb_menu;
    wire [8:0] rgb_gameover;
    wire [8:0] rgb_clear;
    wire [8:0] rgb_plane;
    wire [8:0] rgb_bullet_0;
    wire [8:0] rgb_bullet_1;
    wire [8:0] rgb_bullet_2;
    wire [8:0] rgb_bg;
    wire [8:0] rgb_explosion_plane;
    wire [8:0] rgb_explosion_0;
    wire [8:0] rgb_explosion_1;
    wire [8:0] rgb_explosion_2;
    wire [8:0] rgb_explosion_3;
    wire [8:0] rgb_explosion_4;
    wire [8:0] rgb_explosion_5;
    wire [8:0] rgb_explosion_6;
    wire [8:0] rgb_explosion_7;
    wire [8:0] rgb_explosion_8;
    wire [8:0] rgb_explosion_9;
    wire [8:0] rgb_enemy0;
    wire [8:0] rgb_enemy1;
    wire [8:0] rgb_enemy2;
    wire [8:0] rgb_enemy3;
    wire [8:0] rgb_enemy4;
    wire [8:0] rgb_enemy5;
    wire [8:0] rgb_enemy6;
    wire [8:0] rgb_enemy7;
    wire [8:0] rgb_enemy8;
    wire [8:0] rgb_enemy9;
    wire [8:0] rgb_enemy0_bullet_2;
    wire [8:0] rgb_enemy1_bullet_2;//
    wire [8:0] rgb_enemy2_bullet_2;//
    wire [8:0] rgb_enemy3_bullet_2;//
    wire [8:0] rgb_enemy4_bullet_2;//
    wire [8:0] rgb_enemy5_bullet_2;//
    wire [8:0] rgb_enemy6_bullet_2;//
    wire [8:0] rgb_enemy7_bullet_2;//
    wire [8:0] rgb_enemy8_bullet_2;//
    wire [8:0] rgb_enemy9_bullet_2;//

    wire [8:0] pixel_9;
    wire [11:0] pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt; //480
    wire [9:0] h_offset_plane;
    wire [9:0] v_offset_plane;
    wire [9:0] h_offset_enemy0;
    wire [9:0] v_offset_enemy0;
    wire [9:0] h_offset_enemy1;
    wire [9:0] v_offset_enemy1;
    wire [9:0] h_offset_enemy2;
    wire [9:0] v_offset_enemy2;
    wire [9:0] h_offset_enemy3;
    wire [9:0] v_offset_enemy3;
    wire [9:0] h_offset_enemy4;
    wire [9:0] v_offset_enemy4;
    wire [9:0] h_offset_enemy5;
    wire [9:0] v_offset_enemy5;
    wire [9:0] h_offset_enemy6;
    wire [9:0] v_offset_enemy6;
    wire [9:0] h_offset_enemy7;
    wire [9:0] v_offset_enemy7;
    wire [9:0] h_offset_enemy8;
    wire [9:0] v_offset_enemy8;
    wire [9:0] h_offset_enemy9;
    wire [9:0] v_offset_enemy9;
    wire [9:0] h_offset_enemy0_1;
    wire [9:0] v_offset_enemy0_1;
    wire [9:0] h_offset_enemy1_1;
    wire [9:0] v_offset_enemy1_1;
    wire [9:0] h_offset_enemy2_1;
    wire [9:0] v_offset_enemy2_1;
    wire [9:0] h_offset_enemy3_1;
    wire [9:0] v_offset_enemy3_1;
    wire [9:0] h_offset_enemy4_1;
    wire [9:0] v_offset_enemy4_1;
    wire [9:0] h_offset_enemy5_1;
    wire [9:0] v_offset_enemy5_1;
    wire [9:0] h_offset_enemy6_1;
    wire [9:0] v_offset_enemy6_1;
    wire [9:0] h_offset_enemy7_1;
    wire [9:0] v_offset_enemy7_1;
    wire [9:0] h_offset_enemy8_1;
    wire [9:0] v_offset_enemy8_1;
    wire [9:0] h_offset_enemy9_1;
    wire [9:0] v_offset_enemy9_1;
    
    
    wire is_hit_plane;
    wire is_hit_0;
    wire is_hit_1;
    wire is_hit_2;
    wire is_hit_3;
    wire is_hit_4;
    wire is_hit_5;
    wire is_hit_6;
    wire is_hit_7;
    wire is_hit_8;
    wire is_hit_9;
    wire [8:0] rgb_out_plane;
    wire [8:0] rgb_out_0;
    wire [8:0] rgb_out_1;
    wire [8:0] rgb_out_2;
    wire [8:0] rgb_out_3;
    wire [8:0] rgb_out_4;
    wire [8:0] rgb_out_5;
    wire [8:0] rgb_out_6;
    wire [8:0] rgb_out_7;
    wire [8:0] rgb_out_8;
    wire [8:0] rgb_out_9;
    wire [8:0] rgb_out_plane_bullet_0;
    wire [8:0] rgb_out_plane_bullet_1;
    wire [8:0] rgb_out_plane_bullet_2;
    wire [8:0] rgb_out_enemy0_bullet_2;
    wire [8:0] rgb_out_enemy1_bullet_2;//
    wire [8:0] rgb_out_enemy2_bullet_2;//
    wire [8:0] rgb_out_enemy3_bullet_2;//
    wire [8:0] rgb_out_enemy4_bullet_2;//
    wire [8:0] rgb_out_enemy5_bullet_2;//
    wire [8:0] rgb_out_enemy6_bullet_2;//
    wire [8:0] rgb_out_enemy7_bullet_2;//
    wire [8:0] rgb_out_enemy8_bullet_2;//
    wire [8:0] rgb_out_enemy9_bullet_2;//


    wire [4:0] hit_times;
    wire [2:0] state;

    assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;

//////////////////////clock session/////////////////////////
    clk_1Hz clk4(
        .clk(clk),
        .rst(rst),
        .clk_1Hz(clk_1Hz)
        );    
    clk_10Hz clk0(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz)
        );
    clk_100Hz clk1(
        .clk(clk),
        .rst(rst),
        .clk_100Hz(clk_100Hz)
        );
    clk_200Hz clk2(
        .clk(clk),
        .rst(rst),
        .clk_200Hz(clk_200Hz)
        );
    clk_5s clk3(
        .clk(clk),
        .rst(rst),
        .clk_5s(clk_5s)
        );
    clock_divisor clk_wiz_0_inst(
        .clk(clk),
        .clk1(clk_25MHz),
        .clk22(clk_22)
        );
////////////////////////////////////////////////////





//////////////////keyboard package////////////////
    KeyboardDecoder keyboard_decoder(
        .clk(clk),
        .rst(rst),
        .PS2_CLK(PS2_CLK),
        .PS2_DATA(PS2_DATA),
        .key_valid(key_valid),
        .last_change(last_change),
        .key_down(key_down)
        );
/////////////////////////////////////////////////





///////////////////The GRAND FSM//////////////////
process the_grand_fsm(
    .clk(clk),
    .rst(rst),
    .select0(switch0),
    .select1(switch1),
    .is_died((hit_times==4)?1:0),
    .clear(
        is_hit_0&&
        is_hit_1&&
        is_hit_2&&
        is_hit_3&&
        is_hit_4&&
        is_hit_5&&
        is_hit_6&&
        is_hit_7&&
        is_hit_8&&
        is_hit_9
        ),
    .state(state)
    );

wire [8:0] the_grand_rgb;

the_grand_rgb_mux rgb_mux(
    .state(state),
    .default_color(9'b101011010),
    .rgb_menu(rgb_menu),
    .rgb_gameover(rgb_gameover),
//    .rgb_clear(rgb_clear),
    .pixel_out(pixel_9),
    .rgb_bg(rgb_bg),
    .the_grand_rgb(the_grand_rgb)
    );
    
    
wire [9:0] the_grand_h_offset_enemy0;
wire [9:0] the_grand_v_offset_enemy0;
wire [9:0] the_grand_h_offset_enemy1;
wire [9:0] the_grand_v_offset_enemy1;
wire [9:0] the_grand_h_offset_enemy2;
wire [9:0] the_grand_v_offset_enemy2;
wire [9:0] the_grand_h_offset_enemy3;
wire [9:0] the_grand_v_offset_enemy3;
wire [9:0] the_grand_h_offset_enemy4;
wire [9:0] the_grand_v_offset_enemy4;
wire [9:0] the_grand_h_offset_enemy5;
wire [9:0] the_grand_v_offset_enemy5;
wire [9:0] the_grand_h_offset_enemy6;//
wire [9:0] the_grand_v_offset_enemy6;//
wire [9:0] the_grand_h_offset_enemy7;//
wire [9:0] the_grand_v_offset_enemy7;//
wire [9:0] the_grand_h_offset_enemy8;//
wire [9:0] the_grand_v_offset_enemy8;//
wire [9:0] the_grand_h_offset_enemy9;//
wire [9:0] the_grand_v_offset_enemy9;//
    
     
the_grand_shift_pattern shift_pattern_mux(
    .state(state),
    .h_offset_enemy0(h_offset_enemy0),
    .v_offset_enemy0(v_offset_enemy0),
    .h_offset_enemy1(h_offset_enemy1),
    .v_offset_enemy1(v_offset_enemy1),
    .h_offset_enemy2(h_offset_enemy2),
    .v_offset_enemy2(v_offset_enemy2),
    .h_offset_enemy3(h_offset_enemy3),
    .v_offset_enemy3(v_offset_enemy3),
    .h_offset_enemy4(h_offset_enemy4),
    .v_offset_enemy4(v_offset_enemy4),
    .h_offset_enemy5(h_offset_enemy5),
    .v_offset_enemy5(v_offset_enemy5),
    .h_offset_enemy6(h_offset_enemy6),
    .v_offset_enemy6(v_offset_enemy6),
    .h_offset_enemy7(h_offset_enemy7),
    .v_offset_enemy7(v_offset_enemy7),
    .h_offset_enemy8(h_offset_enemy8),
    .v_offset_enemy8(v_offset_enemy8),
    .h_offset_enemy9(h_offset_enemy9),
    .v_offset_enemy9(v_offset_enemy9),
    .h_offset_enemy0_1(h_offset_enemy0_1),
    .v_offset_enemy0_1(v_offset_enemy0_1),
    .h_offset_enemy1_1(h_offset_enemy1_1),
    .v_offset_enemy1_1(v_offset_enemy1_1),
    .h_offset_enemy2_1(h_offset_enemy2_1),
    .v_offset_enemy2_1(v_offset_enemy2_1),
    .h_offset_enemy3_1(h_offset_enemy3_1),
    .v_offset_enemy3_1(v_offset_enemy3_1),
    .h_offset_enemy4_1(h_offset_enemy4_1),
    .v_offset_enemy4_1(v_offset_enemy4_1),
    .h_offset_enemy5_1(h_offset_enemy5_1),
    .v_offset_enemy5_1(v_offset_enemy5_1),
    .h_offset_enemy6_1(h_offset_enemy6_1),
    .v_offset_enemy6_1(v_offset_enemy6_1),
    .h_offset_enemy7_1(h_offset_enemy7_1),
    .v_offset_enemy7_1(v_offset_enemy7_1),
    .h_offset_enemy8_1(h_offset_enemy8_1),
    .v_offset_enemy8_1(v_offset_enemy8_1),
    .h_offset_enemy9_1(h_offset_enemy9_1),
    .v_offset_enemy9_1(v_offset_enemy9_1),
    .the_grand_h_offset_enemy0(the_grand_h_offset_enemy0),
    .the_grand_v_offset_enemy0(the_grand_v_offset_enemy0),
    .the_grand_h_offset_enemy1(the_grand_h_offset_enemy1),
    .the_grand_v_offset_enemy1(the_grand_v_offset_enemy1),
    .the_grand_h_offset_enemy2(the_grand_h_offset_enemy2),
    .the_grand_v_offset_enemy2(the_grand_v_offset_enemy2),
    .the_grand_h_offset_enemy3(the_grand_h_offset_enemy3),
    .the_grand_v_offset_enemy3(the_grand_v_offset_enemy3),
    .the_grand_h_offset_enemy4(the_grand_h_offset_enemy4),
    .the_grand_v_offset_enemy4(the_grand_v_offset_enemy4),
    .the_grand_h_offset_enemy5(the_grand_h_offset_enemy5),
    .the_grand_v_offset_enemy5(the_grand_v_offset_enemy5),
    .the_grand_h_offset_enemy6(the_grand_h_offset_enemy6),
    .the_grand_v_offset_enemy6(the_grand_v_offset_enemy6),
    .the_grand_h_offset_enemy7(the_grand_h_offset_enemy7),
    .the_grand_v_offset_enemy7(the_grand_v_offset_enemy7),
    .the_grand_h_offset_enemy8(the_grand_h_offset_enemy8),
    .the_grand_v_offset_enemy8(the_grand_v_offset_enemy8),
    .the_grand_h_offset_enemy9(the_grand_h_offset_enemy9),
    .the_grand_v_offset_enemy9(the_grand_v_offset_enemy9)
    );
//////////////////////////////////////////////////





//////////////////background setup///////////////
    wire [9:0] v_offset_bg;
    scroll_down bg(
        .clk(clk_22),
        .rst(rst),
        .v_offset(v_offset_bg)
        );
    bg_addr_gen bg_addr(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .v_offset(v_offset_bg),
        .pixel_addr(pixel_addr_bg)
        );
////////////////////////////////////////////////





/////////////memeory address generators/////////
    menu_addr_gen menu_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(100),
        .height(80),
        .h_offset(110*2),
        .v_offset(80*2),
        .pixel_addr(pixel_addr_menu)
        );

    menu_addr_gen gameover_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(100),
        .height(80),
        .h_offset(110*2),
        .v_offset(80*2),
        .pixel_addr(pixel_addr_gameover)
        );

//    menu_addr_gen clear_addr(
//        .clk(clk_22),
//        .rst(rst),
//        .h_cnt(h_cnt),
//        .v_cnt(v_cnt),
//        .length(200),
//        .height(160),
//        .h_offset(60*2),
//        .v_offset(40*2),
//        .pixel_addr(pixel_addr_clear)
//        );

    all_addr_gen plane_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(h_offset_plane*2),
        .v_offset(v_offset_plane*2),
        .pixel_addr(pixel_addr_plane)
        );
    
    my_bullet_addr plane_bullet_addr(
        .clk_22(clk_22),
        .clk_200Hz(clk_200Hz),
        .rst(rst),
        .h_my_plane(h_offset_plane*2),
        .v_my_plane(v_offset_plane*2),
        .key_down(key_down),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_0(pixel_addr_bullet_0),
        .pixel_addr_bullet_1(pixel_addr_bullet_1),
        .pixel_addr_bullet_2(pixel_addr_bullet_2)
        );


    all_addr_gen enemy0_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy0*2),
        .v_offset(the_grand_v_offset_enemy0*2),
        .pixel_addr(pixel_addr_enemy0)
        );
    enemy_bullet enemy0_bullet(
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy0*2),
        .v_enemy(the_grand_v_offset_enemy0*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy0_bullet_2)
        );


    all_addr_gen enemy1_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy1*2),
        .v_offset(the_grand_v_offset_enemy1*2),
        .pixel_addr(pixel_addr_enemy1)
        );
    enemy_bullet enemy1_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy1*2),
        .v_enemy(the_grand_v_offset_enemy1*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy1_bullet_2)
        );


    all_addr_gen enemy2_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy2*2),
        .v_offset(the_grand_v_offset_enemy2*2),
        .pixel_addr(pixel_addr_enemy2)
        );
    enemy_bullet enemy2_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy2*2),
        .v_enemy(the_grand_v_offset_enemy2*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy2_bullet_2)
        );


    all_addr_gen enemy3_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy3*2),
        .v_offset(the_grand_v_offset_enemy3*2),
        .pixel_addr(pixel_addr_enemy3)
        );
    enemy_bullet enemy3_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy3*2),
        .v_enemy(the_grand_v_offset_enemy3*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy3_bullet_2)
        );


    all_addr_gen enemy4_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy4*2),
        .v_offset(the_grand_v_offset_enemy4*2),
        .pixel_addr(pixel_addr_enemy4)
        );
    enemy_bullet enemy4_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy4*2),
        .v_enemy(the_grand_v_offset_enemy4*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy4_bullet_2)
        );


    all_addr_gen enemy5_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy5*2),
        .v_offset(the_grand_v_offset_enemy5*2),
        .pixel_addr(pixel_addr_enemy5)
        );
    enemy_bullet enemy5_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy5*2),
        .v_enemy(the_grand_v_offset_enemy5*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy5_bullet_2)
        );


    all_addr_gen enemy6_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy6*2),
        .v_offset(the_grand_v_offset_enemy6*2),
        .pixel_addr(pixel_addr_enemy6)
        );
    enemy_bullet enemy6_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy6*2),
        .v_enemy(the_grand_v_offset_enemy6*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy6_bullet_2)
        );


    all_addr_gen enemy7_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy7*2),
        .v_offset(the_grand_v_offset_enemy7*2),
        .pixel_addr(pixel_addr_enemy7)
        );
    enemy_bullet enemy7_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy7*2),
        .v_enemy(the_grand_v_offset_enemy7*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy7_bullet_2)
        );


    all_addr_gen enemy8_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy8*2),
        .v_offset(the_grand_v_offset_enemy8*2),
        .pixel_addr(pixel_addr_enemy8)
        );
    enemy_bullet enemy8_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy8*2),
        .v_enemy(the_grand_v_offset_enemy8*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy8_bullet_2)
        );


    all_addr_gen enemy9_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(the_grand_h_offset_enemy9*2),
        .v_offset(the_grand_v_offset_enemy9*2),
        .pixel_addr(pixel_addr_enemy9)
        );
    enemy_bullet enemy9_bullet(//
        .clk_200Hz(clk_200Hz),
        .clk_5s(clk_22),
        .rst(rst),
        .h_enemy(the_grand_h_offset_enemy9*2),
        .v_enemy(the_grand_v_offset_enemy9*2),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr_bullet_2(pixel_addr_enemy9_bullet_2)
        );
///////////////////////////////////////////////





//////////////////   ips    ///////////////////    
    blk_mem_gen_7 ip_menu(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_menu),
      .dina(data[11:0]),
      .douta(rgb_menu)
    );

    blk_mem_gen_8 ip_gameover(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_gameover),
      .dina(data[11:0]),
      .douta(rgb_gameover)
    );

//    blk_mem_gen_9 ip_clear(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_clear),
//      .dina(data[11:0]),
//      .douta(rgb_clear)
//    );

    blk_mem_gen_0 ip_plane(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_plane),
      .dina(data[11:0]),
      .douta(rgb_plane)
    );
    
    blk_mem_gen_9 ip_plane_bullet_0(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_bullet_0),
      .dina(data[11:0]),
      .douta(rgb_bullet_0)
    );

    blk_mem_gen_9 ip_plane_bullet_1(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_bullet_1),
      .dina(data[11:0]),
      .douta(rgb_bullet_1)
    );

    blk_mem_gen_9 ip_plane_bullet_2(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_bullet_2)
    );

    blk_mem_gen_6 ip_explosion_plane(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_plane),
      .dina(data[11:0]),
      .douta(rgb_explosion_plane)
    );

    blk_mem_gen_6 ip_explosion_0(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy0),
      .dina(data[11:0]),
      .douta(rgb_explosion_0)
    );

    blk_mem_gen_6 ip_explosion_1(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy1),
      .dina(data[11:0]),
      .douta(rgb_explosion_1)
    );

    blk_mem_gen_6 ip_explosion_2(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy2),
      .dina(data[11:0]),
      .douta(rgb_explosion_2)
    );
    blk_mem_gen_6 ip_explosion_3(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy3),
      .dina(data[11:0]),
      .douta(rgb_explosion_3)
    );
    blk_mem_gen_6 ip_explosion_4(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy4),
      .dina(data[11:0]),
      .douta(rgb_explosion_4)
    );
    blk_mem_gen_6 ip_explosion_5(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy5),
      .dina(data[11:0]),
      .douta(rgb_explosion_5)
    );
    blk_mem_gen_6 ip_explosion_6(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy6),
      .dina(data[11:0]),
      .douta(rgb_explosion_6)
    );
    blk_mem_gen_6 ip_explosion_7(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy7),
      .dina(data[11:0]),
      .douta(rgb_explosion_7)
    );
    blk_mem_gen_6 ip_explosion_8(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy8),
      .dina(data[11:0]),
      .douta(rgb_explosion_8)
    );
    blk_mem_gen_6 ip_explosion_9(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy9),
      .dina(data[11:0]),
      .douta(rgb_explosion_9)
    );


    blk_mem_gen_3 ip_enemy0(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy0),
      .dina(data[11:0]),
      .douta(rgb_enemy0)
    );
    blk_mem_gen_2 ip_enemy0_bullet(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy0_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy0_bullet_2)
    );


    blk_mem_gen_4 ip_enemy1(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy1),
      .dina(data[11:0]),
      .douta(rgb_enemy1)
    );
    blk_mem_gen_10 ip_enemy1_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy1_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy1_bullet_2)
    );


    blk_mem_gen_5 ip_enemy2(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy2),
      .dina(data[11:0]),
      .douta(rgb_enemy2)
    );
    blk_mem_gen_11 ip_enemy2_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy2_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy2_bullet_2)
    );


    blk_mem_gen_3 ip_enemy3(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy3),
      .dina(data[11:0]),
      .douta(rgb_enemy3)
    );
    blk_mem_gen_2 ip_enemy3_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy3_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy3_bullet_2)
    );


    blk_mem_gen_4 ip_enemy4(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy4),
      .dina(data[11:0]),
      .douta(rgb_enemy4)
    );
    blk_mem_gen_10 ip_enemy4_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy4_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy4_bullet_2)
    );


    blk_mem_gen_5 ip_enemy5(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy5),
      .dina(data[11:0]),
      .douta(rgb_enemy5)
    );
    blk_mem_gen_11 ip_enemy5_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy5_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy5_bullet_2)
    );


    blk_mem_gen_3 ip_enemy6(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy6),
      .dina(data[11:0]),
      .douta(rgb_enemy6)
    );
    blk_mem_gen_2 ip_enemy6_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy6_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy6_bullet_2)
    );


    blk_mem_gen_4 ip_enemy7(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy7),
      .dina(data[11:0]),
      .douta(rgb_enemy7)
    );
    blk_mem_gen_10 ip_enemy7_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy7_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy7_bullet_2)
    );


    blk_mem_gen_5 ip_enemy8(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy8),
      .dina(data[11:0]),
      .douta(rgb_enemy8)
    );
    blk_mem_gen_11 ip_enemy8_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy8_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy8_bullet_2)
    );


    blk_mem_gen_3 ip_enemy9(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy9),
      .dina(data[11:0]),
      .douta(rgb_enemy9)
    );
    blk_mem_gen_2 ip_enemy9_bullet(//
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_enemy9_bullet_2),
      .dina(data[11:0]),
      .douta(rgb_enemy9_bullet_2)
    );


    blk_mem_gen_1 ip_bg(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_bg),
      .dina(data[11:0]),
      .douta(rgb_bg)
    );
////////////////////////////////////////////////////////





////////////////////physic mechanics////////////////////
    layer_compare layer_compare(
        .rgb_plane(rgb_out_plane),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_bg(rgb_bg),
        .rgb_enemy0(rgb_out_0),
        .rgb_enemy1(rgb_out_1),
        .rgb_enemy2(rgb_out_2),
        .rgb_enemy3(rgb_out_3),
        .rgb_enemy4(rgb_out_4),
        .rgb_enemy5(rgb_out_5),
        .rgb_enemy6(rgb_out_6),
        .rgb_enemy7(rgb_out_7),
        .rgb_enemy8(rgb_out_8),
        .rgb_enemy9(rgb_out_9),
        .rgb_enemy0_bullet_2(rgb_out_enemy0_bullet_2),
        .rgb_enemy1_bullet_2(rgb_out_enemy1_bullet_2),//
        .rgb_enemy2_bullet_2(rgb_out_enemy2_bullet_2),//
        .rgb_enemy3_bullet_2(rgb_out_enemy3_bullet_2),//
        .rgb_enemy4_bullet_2(rgb_out_enemy4_bullet_2),//
        .rgb_enemy5_bullet_2(rgb_out_enemy5_bullet_2),//
        .rgb_enemy6_bullet_2(rgb_out_enemy6_bullet_2),//
        .rgb_enemy7_bullet_2(rgb_out_enemy7_bullet_2),//
        .rgb_enemy8_bullet_2(rgb_out_enemy8_bullet_2),//
        .rgb_enemy9_bullet_2(rgb_out_enemy9_bullet_2),//
        .default_color(9'b101011010),
        .pixel_out(pixel_9)
        );
       
    object_phase_for_plane object_phase_plane(
        .clk_1Hz(clk_1Hz),
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_plane(rgb_plane),
        .rgb_enemy0(rgb_out_0),
        .rgb_enemy1(rgb_out_1),
        .rgb_enemy2(rgb_out_2),
        .rgb_enemy3(rgb_out_3),
        .rgb_enemy4(rgb_out_4),
        .rgb_enemy5(rgb_out_5),
        .rgb_enemy6(rgb_out_6),
        .rgb_enemy7(rgb_out_7),
        .rgb_enemy8(rgb_out_8),
        .rgb_enemy9(rgb_out_9),
        .rgb_enemy0_bullet_2(rgb_out_enemy0_bullet_2),
        .rgb_enemy1_bullet_2(rgb_out_enemy1_bullet_2),//
        .rgb_enemy2_bullet_2(rgb_out_enemy2_bullet_2),//
        .rgb_enemy3_bullet_2(rgb_out_enemy3_bullet_2),//
        .rgb_enemy4_bullet_2(rgb_out_enemy4_bullet_2),//
        .rgb_enemy5_bullet_2(rgb_out_enemy5_bullet_2),//
        .rgb_enemy6_bullet_2(rgb_out_enemy6_bullet_2),//
        .rgb_enemy7_bullet_2(rgb_out_enemy7_bullet_2),//
        .rgb_enemy8_bullet_2(rgb_out_enemy8_bullet_2),//
        .rgb_enemy9_bullet_2(rgb_out_enemy9_bullet_2),//
        .rgb_explosion(rgb_explosion_plane),
        .rgb_out(rgb_out_plane),
        .is_hit(is_hit_plane),
        .hit_times(hit_times)
        );

    object_phase_for_bullet object_phase_plane_bullet_0(
        .rgb_bullet(rgb_bullet_0),
        .default_color(9'b101011010),
        .hit_times(hit_times),
        .is_hit(is_hit_plane),
        .rgb_out(rgb_out_plane_bullet_0)
        );

    object_phase_for_bullet object_phase_plane_bullet_1(
        .rgb_bullet(rgb_bullet_1),
        .default_color(9'b101011010),
        .hit_times(hit_times),
        .is_hit(is_hit_plane),
        .rgb_out(rgb_out_plane_bullet_1)
        );

    object_phase_for_bullet object_phase_plane_bullet_2(
        .rgb_bullet(rgb_bullet_2),
        .default_color(9'b101011010),
        .hit_times(hit_times),
        .is_hit(is_hit_plane),
        .rgb_out(rgb_out_plane_bullet_2)
        );


    object_phase object_phase_enemy0(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy0),
        .rgb_explosion(rgb_explosion_0),
        .rgb_out(rgb_out_0),
        .is_hit(is_hit_0)
        );
    object_phase_for_enemy_bullet object_phase_enemy0_bullet_2(
        .rgb_bullet(rgb_enemy0_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_0),
        .rgb_out(rgb_out_enemy0_bullet_2)
        );


    object_phase object_phase_enemy1(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy1),
        .rgb_explosion(rgb_explosion_1),
        .rgb_out(rgb_out_1),
        .is_hit(is_hit_1)
        );
    object_phase_for_enemy_bullet object_phase_enemy1_bullet_2(//
        .rgb_bullet(rgb_enemy1_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_1),
        .rgb_out(rgb_out_enemy1_bullet_2)
        );


    object_phase object_phase_enemy2(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy2),
        .rgb_explosion(rgb_explosion_2),
        .rgb_out(rgb_out_2),
        .is_hit(is_hit_2)
        );
    object_phase_for_enemy_bullet object_phase_enemy2_bullet_2(//
        .rgb_bullet(rgb_enemy2_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_2),
        .rgb_out(rgb_out_enemy2_bullet_2)
        );


    object_phase object_phase_enemy3(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy3),
        .rgb_explosion(rgb_explosion_3),
        .rgb_out(rgb_out_3),
        .is_hit(is_hit_3)
        );
    object_phase_for_enemy_bullet object_phase_enemy3_bullet_2(//
        .rgb_bullet(rgb_enemy3_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_3),
        .rgb_out(rgb_out_enemy3_bullet_2)
        );


    object_phase object_phase_enemy4(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy4),
        .rgb_explosion(rgb_explosion_4),
        .rgb_out(rgb_out_4),
        .is_hit(is_hit_4)
        );
    object_phase_for_enemy_bullet object_phase_enemy4_bullet_2(//
        .rgb_bullet(rgb_enemy4_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_4),
        .rgb_out(rgb_out_enemy4_bullet_2)
        );


    object_phase object_phase_enemy5(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy5),
        .rgb_explosion(rgb_explosion_5),
        .rgb_out(rgb_out_5),
        .is_hit(is_hit_5)
        );
    object_phase_for_enemy_bullet object_phase_enemy5_bullet_2(//
        .rgb_bullet(rgb_enemy5_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_5),
        .rgb_out(rgb_out_enemy5_bullet_2)
        );


    object_phase object_phase_enemy6(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy6),
        .rgb_explosion(rgb_explosion_6),
        .rgb_out(rgb_out_6),
        .is_hit(is_hit_6)
        );
    object_phase_for_enemy_bullet object_phase_enemy6_bullet_2(//
        .rgb_bullet(rgb_enemy6_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_6),
        .rgb_out(rgb_out_enemy6_bullet_2)
        );


    object_phase object_phase_enemy7(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy7),
        .rgb_explosion(rgb_explosion_7),
        .rgb_out(rgb_out_7),
        .is_hit(is_hit_7)
        );
    object_phase_for_enemy_bullet object_phase_enemy7_bullet_2(//
        .rgb_bullet(rgb_enemy7_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_7),
        .rgb_out(rgb_out_enemy7_bullet_2)
        );


    object_phase object_phase_enemy8(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy8),
        .rgb_explosion(rgb_explosion_8),
        .rgb_out(rgb_out_8),
        .is_hit(is_hit_8)
        );
    object_phase_for_enemy_bullet object_phase_enemy8_bullet_2(//
        .rgb_bullet(rgb_enemy8_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_8),
        .rgb_out(rgb_out_enemy8_bullet_2)
        );


    object_phase object_phase_enemy9(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz),
        .rgb_bullet_0(rgb_out_plane_bullet_0),
        .rgb_bullet_1(rgb_out_plane_bullet_1),
        .rgb_bullet_2(rgb_out_plane_bullet_2),
        .rgb_enemy(rgb_enemy9),
        .rgb_explosion(rgb_explosion_9),
        .rgb_out(rgb_out_9),
        .is_hit(is_hit_9)
        );
    object_phase_for_enemy_bullet object_phase_enemy9_bullet_2(//
        .rgb_bullet(rgb_enemy9_bullet_2),
        .default_color(9'b101011010),
        .is_hit(is_hit_9),
        .rgb_out(rgb_out_enemy9_bullet_2)
        );
//////////////////////////////////////////////////////





/////////////////////Life Remain//////////////////////
    decoder dcd(
        .num(5'd16 - hit_times*4),
        .i(led)
        );
//////////////////////////////////////////////////////





///////////////////vga display////////////////////////
    nine_to_twe bit_convertor(
        .pixel(the_grand_rgb),
        .new_pixel(pixel)
    );

    vga_controller vga_inst(
      .pclk(clk_25MHz),
      .reset(rst),
      .hsync(hsync),
      .vsync(vsync),
      .valid(valid),
      .h_cnt(h_cnt),
      .v_cnt(v_cnt)
    );
//////////////////////////////////////////////////////





////////////////object moving pattern/////////////////
    move_control moving_pattern_plane(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd160),
        .v_initial(10'd223),
        .key_down(key_down),
        .last_change(last_change),
        .h_offset(h_offset_plane),
        .v_offset(v_offset_plane)
        );
///////////////////////////////////////////////////////





///////////////////LEVEL 1///////////////////////    
    horizental_shift moving_pattern_enemy0(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd0),
        .v_initial(10'd0),
        .h_offset(h_offset_enemy0),
        .v_offset(v_offset_enemy0)
        );
        
    horizental_shift moving_pattern_enemy1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd16),
        .v_initial(10'd16),
        .h_offset(h_offset_enemy1),
        .v_offset(v_offset_enemy1)
        );
            
    horizental_shift moving_pattern_enemy2(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd32),
        .v_initial(10'd32),
        .h_offset(h_offset_enemy2),
        .v_offset(v_offset_enemy2)
        );
    horizental_shift moving_pattern_enemy3(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd48),
        .v_initial(10'd48),
        .h_offset(h_offset_enemy3),
        .v_offset(v_offset_enemy3)
        );
    horizental_shift moving_pattern_enemy4(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd64),
        .v_initial(10'd64),
        .h_offset(h_offset_enemy4),
        .v_offset(v_offset_enemy4)
        );
    horizental_shift moving_pattern_enemy5(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd80),
        .v_initial(10'd80),
        .h_offset(h_offset_enemy5),
        .v_offset(v_offset_enemy5)
        );
    horizental_shift moving_pattern_enemy6(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd96),
        .v_initial(10'd96),
        .h_offset(h_offset_enemy6),
        .v_offset(v_offset_enemy6)
        );
    horizental_shift moving_pattern_enemy7(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd112),
        .v_initial(10'd112),
        .h_offset(h_offset_enemy7),
        .v_offset(v_offset_enemy7)
        );
    horizental_shift moving_pattern_enemy8(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd128),
        .v_initial(10'd128),
        .h_offset(h_offset_enemy8),
        .v_offset(v_offset_enemy8)
        );
    horizental_shift moving_pattern_enemy9(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd144),
        .v_initial(10'd144),
        .h_offset(h_offset_enemy9),
        .v_offset(v_offset_enemy9)
        );
///////////////////////////////////////////



////////////////LEVEL 2////////////////////    
    screensaver moving_pattern_enemy0_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd0),
        .v_initial(10'd0),
        .h_offset(h_offset_enemy0_1),
        .v_offset(v_offset_enemy0_1)
        );
        
    screensaver moving_pattern_enemy1_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd0),
        .v_initial(10'd48),
        .h_offset(h_offset_enemy1_1),
        .v_offset(v_offset_enemy1_1)
        );
            
    screensaver moving_pattern_enemy2_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd0),
        .v_initial(10'd96),
        .h_offset(h_offset_enemy2_1),
        .v_offset(v_offset_enemy2_1)
        );
    screensaver moving_pattern_enemy3_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd0),
        .v_initial(10'd144),
        .h_offset(h_offset_enemy3_1),
        .v_offset(v_offset_enemy3_1)
        );
    screensaver moving_pattern_enemy4_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd0),
        .v_initial(10'd192),
        .h_offset(h_offset_enemy4_1),
        .v_offset(v_offset_enemy4_1)
        );
    screensaver moving_pattern_enemy5_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd303),
        .v_initial(10'd0),
        .h_offset(h_offset_enemy5_1),
        .v_offset(v_offset_enemy5_1)
        );
    screensaver moving_pattern_enemy6_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd303),
        .v_initial(10'd48),
        .h_offset(h_offset_enemy6_1),
        .v_offset(v_offset_enemy6_1)
        );
    screensaver moving_pattern_enemy7_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd303),
        .v_initial(10'd96),
        .h_offset(h_offset_enemy7_1),
        .v_offset(v_offset_enemy7_1)
        );
    screensaver moving_pattern_enemy8_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd303),
        .v_initial(10'd144),
        .h_offset(h_offset_enemy8_1),
        .v_offset(v_offset_enemy8_1)
        );
    screensaver moving_pattern_enemy9_1(
        .clk(clk_100Hz),
        .rst(rst),
        .h_initial(10'd303),
        .v_initial(10'd192),
        .h_offset(h_offset_enemy9_1),
        .v_offset(v_offset_enemy9_1)
        );
/////////////////////////////////////////



////////////////Score Display///////////////////// 
wire [1:0] ssd_ctl;
wire [13:0] score;
wire [3:0] i;

freq_div U0(
    .clk(clk),
    .rst(rst),
    .ssd_ctl(ssd_ctl)
    );

hit_counter U1(
    .is_hit_0(is_hit_0),
    .is_hit_1(is_hit_1),
    .is_hit_2(is_hit_2),
    .is_hit_3(is_hit_3),
    .is_hit_4(is_hit_4),
    .is_hit_5(is_hit_5),
    .is_hit_6(is_hit_6),
    .is_hit_7(is_hit_7),
    .is_hit_8(is_hit_8),
    .is_hit_9(is_hit_9),
    .score(score)
    );

ssd_ctl U2(
    .ssd_ctl(ssd_ctl),
    .d_0(score%10),
    .d_1(score/10%10),
    .d_2(score/100%10),
    .d_3(score/1000),
    .four(four),
    .i(i)
    );

ssd U3(
    .i(i),
    .ssd(ssd)
    );
//////////////////////////////////////////////////





endmodule