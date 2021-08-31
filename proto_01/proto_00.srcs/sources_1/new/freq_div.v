`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/01 00:39:15
// Design Name: 
// Module Name: freq_div
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


module freq_div(clk_out,clk,rst,ssd_ctl);
output reg clk_out=1'b0;
output [1:0] ssd_ctl;
input clk,rst;
reg [25:0] cnt=26'b0;

assign ssd_ctl=cnt[18:17];

always@(posedge clk or posedge rst) begin
    if (rst) begin
        cnt<=26'b0;
        clk_out<=1'b0;
    end
    else begin
        cnt<=cnt+1'b1;
        if (cnt==5000_0000-1) begin
            cnt<=26'b0;
            clk_out<=~clk_out;
        end
    end
end
endmodule
