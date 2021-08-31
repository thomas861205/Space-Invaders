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
   inout PS2_DATA,
   inout PS2_CLK,
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   output hsync,
   output vsync
    );
    
    wire clk_10Hz;
    wire [8:0] last_change;
    wire [511:0] key_down;
    wire key_valid;
    wire [11:0] data;
    wire clk_25MHz;
    wire clk_22;
    wire [16:0] pixel_addr_bg;
    wire [12:0] pixel_addr_plane;
    wire [12:0] pixel_addr_bullet;
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
    wire [8:0] rgb_plane;
    wire [8:0] rgb_bullet;
    wire [8:0] rgb_bg;
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

  assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? pixel:12'h0;

     clock_divisor clk_wiz_0_inst(
      .clk(clk),
      .clk1(clk_25MHz),
      .clk22(clk_22)
      );

    KeyboardDecoder keyboard_decoder(
        .clk(clk),
        .rst(rst),
        .PS2_CLK(PS2_CLK),
        .PS2_DATA(PS2_DATA),
        .key_valid(key_valid),
        .last_change(last_change),
        .key_down(key_down)
        );
        
    bg_addr_gen bg_addr(
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .pixel_addr(pixel_addr_bg)
        );
   
//////////////////////////////////////////        
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

    all_addr_gen bullet_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(160*2),
        .v_offset(120*2),
        .pixel_addr(pixel_addr_bullet)
        );

    all_addr_gen enemy0_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(h_offset_enemy0*2),
        .v_offset(v_offset_enemy0*2),
        .pixel_addr(pixel_addr_enemy0)
        );
        
    all_addr_gen enemy1_addr(
        .clk(clk_22),
        .rst(rst),
        .h_cnt(h_cnt),
        .v_cnt(v_cnt),
        .length(16),
        .height(16),
        .h_offset(h_offset_enemy1*2),
        .v_offset(v_offset_enemy1*2),
        .pixel_addr(pixel_addr_enemy1)
        );
            
//    all_addr_gen enemy2_addr(
//        .clk(clk_22),
//        .rst(rst),
//        .h_cnt(h_cnt),
//        .v_cnt(v_cnt),
//        .length(16),
//        .height(16),
//        .h_offset(h_offset_enemy2*2),
//        .v_offset(v_offset_enemy2*2),
//        .pixel_addr(pixel_addr_enemy2)
//        );

//    all_addr_gen enemy3_addr(
//        .clk(clk_22),
//        .rst(rst),
//        .h_cnt(h_cnt),
//        .v_cnt(v_cnt),
//        .length(16),
//        .height(16),
//        .h_offset(h_offset_enemy3*2),
//        .v_offset(v_offset_enemy3*2),
//        .pixel_addr(pixel_addr_enemy3)
//        );

//    all_addr_gen enemy4_addr(
//        .clk(clk_22),
//        .rst(rst),
//        .h_cnt(h_cnt),
//        .v_cnt(v_cnt),
//        .length(16),
//        .height(16),
//        .h_offset(h_offset_enemy4*2),
//        .v_offset(v_offset_enemy4*2),
//        .pixel_addr(pixel_addr_enemy4)
//        );

//    all_addr_gen enemy5_addr(
//      .clk(clk_22),
//      .rst(rst),
//      .h_cnt(h_cnt),
//      .v_cnt(v_cnt),
//      .length(16),
//      .height(16),
//      .h_offset(h_offset_enemy5*2),
//      .v_offset(v_offset_enemy5*2),
//      .pixel_addr(pixel_addr_enemy5)
//      );

//    all_addr_gen enemy6_addr(
//        .clk(clk_22),
//        .rst(rst),
//        .h_cnt(h_cnt),
//        .v_cnt(v_cnt),
//        .length(16),
//        .height(16),
//        .h_offset(h_offset_enemy6*2),
//        .v_offset(v_offset_enemy6*2),
//        .pixel_addr(pixel_addr_enemy6)
//        );

//    all_addr_gen enemy7_addr(
//        .clk(clk_22),
//        .rst(rst),
//        .h_cnt(h_cnt),
//        .v_cnt(v_cnt),
//        .length(16),
//        .height(16),
//        .h_offset(h_offset_enemy7*2),
//        .v_offset(v_offset_enemy7*2),
//        .pixel_addr(pixel_addr_enemy7)
//        );

//    all_addr_gen enemy8_addr(
//        .clk(clk_22),
//        .rst(rst),
//        .h_cnt(h_cnt),
//        .v_cnt(v_cnt),
//        .length(16),
//        .height(16),
//        .h_offset(h_offset_enemy8*2),
//        .v_offset(v_offset_enemy8*2),
//        .pixel_addr(pixel_addr_enemy8)
//        );

//    all_addr_gen enemy9_addr(
//        .clk(clk_22),
//        .rst(rst),
//        .h_cnt(h_cnt),
//        .v_cnt(v_cnt),
//        .length(16),
//        .height(16),
//        .h_offset(h_offset_enemy9*2),
//        .v_offset(v_offset_enemy9*2),
//        .pixel_addr(pixel_addr_enemy9)
//        );
////////////////////////////////////////////        
    blk_mem_gen_0 ip_plane(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_plane),
      .dina(data[11:0]),
      .douta(rgb_plane)
    ); 
     
//    blk_mem_gen_2 ip_bullet(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_bullet),
//      .dina(data[11:0]),
//      .douta(rgb_bullet)
//    );
////////////////////////////////////
//    blk_mem_gen_3 ip_enemy0(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy0),
//      .dina(data[11:0]),
//      .douta(rgb_enemy0)
//    );
//    blk_mem_gen_4 ip_enemy1(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy1),
//      .dina(data[11:0]),
//      .douta(rgb_enemy1)
//    );
//    blk_mem_gen_5 ip_enemy2(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy2),
//      .dina(data[11:0]),
//      .douta(rgb_enemy2)
//    );
//    blk_mem_gen_6 ip_enemy3(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy3),
//      .dina(data[11:0]),
//      .douta(rgb_enemy3)
//    );
//    blk_mem_gen_7 ip_enemy4(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy4),
//      .dina(data[11:0]),
//      .douta(rgb_enemy4)
//    );
//    blk_mem_gen_8 ip_enemy5(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy5),
//      .dina(data[11:0]),
//      .douta(rgb_enemy5)
//    );
//    blk_mem_gen_9 ip_enemy6(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy6),
//      .dina(data[11:0]),
//      .douta(rgb_enemy6)
//    );
//    blk_mem_gen_10 ip_enemy7(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy7),
//      .dina(data[11:0]),
//      .douta(rgb_enemy7)
//    );
//    blk_mem_gen_11 ip_enemy8(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy8),
//      .dina(data[11:0]),
//      .douta(rgb_enemy8)
//    );
//    blk_mem_gen_12 ip_enemy9(
//      .clka(clk_25MHz),
//      .wea(0),
//      .addra(pixel_addr_enemy9),
//      .dina(data[11:0]),
//      .douta(rgb_enemy9)
//    );
///////////////////////////    
    blk_mem_gen_1 ip_bg(
      .clka(clk_25MHz),
      .wea(0),
      .addra(pixel_addr_bg),
      .dina(data[11:0]),
      .douta(rgb_bg)
    );
///////////////////////////    
    layer_compare layer_compare(
        .rgb_plane(rgb_plane),
//        .rgb_bullet(rgb_bullet),
        .rgb_bg(rgb_bg),
//        .rgb_enemy0(rgb_enemy0),
//        .rgb_enemy1(rgb_enemy1),
//        .rgb_enemy2(rgb_enemy2),
//        .rgb_enemy3(rgb_enemy3),
//        .rgb_enemy4(rgb_enemy4),
//        .rgb_enemy5(rgb_enemy5),
//        .rgb_enemy6(rgb_enemy6),
//        .rgb_enemy7(rgb_enemy7),
//        .rgb_enemy8(rgb_enemy8),
//        .rgb_enemy9(rgb_enemy9),
        .default_color(9'b101011010),
        .pixel_out(pixel_9)
        );
    
    nine_to_twe nine_to_twe(
        .pixel(pixel_9),
        .new_pixel(pixel)
    );

    vga_controller   vga_inst(
      .pclk(clk_25MHz),
      .reset(rst),
      .hsync(hsync),
      .vsync(vsync),
      .valid(valid),
      .h_cnt(h_cnt),
      .v_cnt(v_cnt)
    );
    
    clk_10Hz clk0(
        .clk(clk),
        .rst(rst),
        .clk_10Hz(clk_10Hz)
    );
////////////////////////////////////////////    
    move_control plane(
        .clk(clk_10Hz),
        .rst(rst),
        .h_initial(10'd160),
        .v_initial(10'd223),
        .key_down(key_down),
        .last_change(last_change),
        .h_offset(h_offset_plane),
        .v_offset(v_offset_plane)
        );
    
//    screensaver enemy0(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd0),
//        .v_initial(10'd0),
//        .h_offset(h_offset_enemy0),
//        .v_offset(v_offset_enemy0)
//        );
        
//    screensaver enemy1(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd64),
//        .v_initial(10'd0),
//        .h_offset(h_offset_enemy1),
//        .v_offset(v_offset_enemy1)
//        );
            
//    screensaver enemy2(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd128),
//        .v_initial(10'd0),
//        .h_offset(h_offset_enemy2),
//        .v_offset(v_offset_enemy2)
//        );

//    screensaver enemy3(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd192),
//        .v_initial(10'd0),
//        .h_offset(h_offset_enemy3),
//        .v_offset(v_offset_enemy3)
//        );

//    screensaver enemy4(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd256),
//        .v_initial(10'd0),
//        .h_offset(h_offset_enemy4),
//        .v_offset(v_offset_enemy4)
//        );

//    screensaver enemy5(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd32),
//        .v_initial(10'd120),
//        .h_offset(h_offset_enemy5),
//        .v_offset(v_offset_enemy5)
//        );

//    screensaver enemy6(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd96),
//        .v_initial(10'd120),
//        .h_offset(h_offset_enemy6),
//        .v_offset(v_offset_enemy6)
//        );

//    screensaver enemy7(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd160),
//        .v_initial(10'd120),
//        .h_offset(h_offset_enemy7),
//        .v_offset(v_offset_enemy7)
//        );

//    screensaver enemy8(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd224),
//        .v_initial(10'd120),
//        .h_offset(h_offset_enemy8),
//        .v_offset(v_offset_enemy8)
//        );

//    screensaver enemy9(
//        .clk(clk_10Hz),
//        .rst(rst),
//        .h_initial(10'd288),
//        .v_initial(10'd120),
//        .h_offset(h_offset_enemy9),
//        .v_offset(v_offset_enemy9)
//        );
        
///////////////////////////////////////
endmodule

