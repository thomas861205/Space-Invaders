`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/22 16:16:53
// Design Name: 
// Module Name: clock_50Mhz
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


module clock_50Mhz(clk_out,clk);
input clk;
output clk_out;
reg [1:0] num;
wire [1:0] next_num;

always @(negedge clk) begin
  num <= next_num;
end

assign next_num = num + 1'b1;
assign clk_out=num[1];
endmodule
