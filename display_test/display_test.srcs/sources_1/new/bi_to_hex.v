`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/25 01:13:32
// Design Name: 
// Module Name: bi_to_hex
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


module bi_to_hex(
    pixel,hex_pixel
    );
input [2:0] pixel;
output reg [11:0] hex_pixel;

always@(*)begin
    if(pixel[0]) hex_pixel[3:0]=4'hf;
    else hex_pixel[3:0]=4'h0;
end
always@(*)begin
    if(pixel[1]) hex_pixel[7:4]=4'hf;
    else hex_pixel[7:4]=4'h0;
end
always@(*)begin
    if(pixel[2]) hex_pixel[11:8]=4'hf;
    else hex_pixel[11:8]=4'h0;
end
endmodule
