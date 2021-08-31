`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/26 08:11:55
// Design Name: 
// Module Name: nine_to_twe
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


module nine_to_twe(pixel,new_pixel);
    input [8:0] pixel;
    output [11:0] new_pixel;

    assign new_pixel[3:0]= (pixel[2:0]==3'b111) ? 4'b1111 : 2*pixel[2:0];
    assign new_pixel[7:4]= (pixel[5:3]==3'b111) ? 4'b1111 : 2*pixel[5:3];
    assign new_pixel[11:8]=(pixel[8:6]==3'b111) ? 4'b1111 : 2*pixel[8:6];

endmodule
