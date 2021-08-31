`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/16 03:28:17
// Design Name: 
// Module Name: menu_addr_gen
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


module menu_addr_gen(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input [9:0] length,
   input [9:0] height,
   input [9:0] h_offset,
   input [9:0] v_offset,
   output reg [16:0] pixel_addr
   );
   
   wire [9:0] h;
   wire [9:0] v;

   assign h = h_cnt%640;
   assign v = v_cnt%480;

   
   always @(*) begin
     if (h>=h_offset && h<(h_offset + length*2) && 
         v>=v_offset && v<(v_offset + height*2))
     begin
        pixel_addr = (((h - h_offset)>>1) + length*((v - v_offset)>>1));
     end
     else begin
       pixel_addr = length*height - 1;
     end
   end

    
endmodule
