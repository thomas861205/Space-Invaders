`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/24 20:40:29
// Design Name: 
// Module Name: blk_mem_gen_for_blk_1
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


module blk_mem_gen_for_blk_1(
   input clk,
   input rst,
   input [9:0] h_cnt,
   input [9:0] v_cnt,
   output [16:0] pixel_addr
   );
    
   reg [7:0] position;
  
   assign pixel_addr = ((h_cnt>>1)+320*(v_cnt>>1)+ position*320)%76800;  //640*480 --> 320*240 

   always @ (posedge clk or posedge rst) begin
      if(rst)
          position <= 0;
       else if(position < 240-1)
           position <= position;
       else
           position <= 0;
   end
    
endmodule
