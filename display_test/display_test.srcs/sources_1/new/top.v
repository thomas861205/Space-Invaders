`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/22 15:59:31
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
   output [3:0] vgaRed,
   output [3:0] vgaGreen,
   output [3:0] vgaBlue,
   output hsync,
   output vsync
    );

    wire [11:0] data;
    wire clk_25MHz;
    wire clk_22;
    wire clk_50MHz;
    wire [16:0] pixel_addr;
    wire [16:0] pixel_addr_1;
    wire [11:0] pixel,rgb,hex_pixel;
    wire valid;
    wire [9:0] h_cnt; //640
    wire [9:0] v_cnt;  //480
    

  assign {vgaRed, vgaGreen, vgaBlue} = (valid==1'b1) ? hex_pixel:12'h0;

     clock_divisor clk_wiz_0_inst(
      .clk(clk),
      .clk1(clk_25MHz),
      .clk22(clk_22)
    );
    
    clock_50Mhz clk50z(
        .clk(clk),
        .clk_out(clk_50MHz));

    mem_addr_gen mem_addr_gen_inst(
    .clk(clk_22),
    .rst(rst),
    .h_cnt(h_cnt),
    .v_cnt(v_cnt),
    .pixel_addr(pixel_addr)
    );
    
    blk_mem_gen_0 blk_mem_gen_0_inst(
      .clka(~clk_25MHz),
      .wea(0),
      .addra(pixel_addr),
      .dina(data[11:0]),
      .douta(rgb)
    );

    blk_mem_gen_1 blk_mem_gen_1_inst(
          .clka(clk_50MHz),
          .wea(clk_25MHz),
          .addra(pixel_addr),
          .dina(rgb),
          .douta(pixel)
        );
        
    bi_to_hex bth(
        .pixel(pixel),
        .hex_pixel(hex_pixel)
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
      
endmodule

