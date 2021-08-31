`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/15 20:23:46
// Design Name: 
// Module Name: bg_addr_gen
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


module bg_addr_gen(
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   input [9:0] v_offset,
   output [16:0] pixel_addr
   );
   assign pixel_addr = (((h_cnt%640)>>1)+320*(v_offset+((v_cnt%480)>>1)))% 76800;
endmodule
