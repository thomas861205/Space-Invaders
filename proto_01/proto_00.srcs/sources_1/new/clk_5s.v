`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/09 09:17:51
// Design Name: 
// Module Name: clk_5s
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


module clk_5s(clk,rst,clk_5s);
    input clk;
    input rst;
    output reg clk_5s;
    reg [27:0] cnt;
    always @( posedge clk or posedge rst)begin
        if(rst) begin
            cnt <= 28'b0;
            clk_5s <= 1'b0;
        end
        else begin
            cnt <= cnt + 1'b1;
            if(cnt == 28'd2_5000_0000) begin
                cnt <= 0;
                clk_5s <= ~clk_5s;
            end
        end
    end                 
endmodule
