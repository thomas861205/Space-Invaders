`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 12:04:07
// Design Name: 
// Module Name: clk_100Hz
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


module clk_100Hz(clk,rst,clk_100Hz);
    input clk;
    input rst;
    output reg clk_100Hz ;
    reg [26:0] cnt;
    always @( posedge clk or posedge rst)begin
        if(rst) begin
            cnt <= 27'b0;
            clk_100Hz <= 1'b0;
        end
        else begin
            cnt <= cnt + 1'b1;
            if(cnt == 27'd500_000) begin
                cnt <= 0;
                clk_100Hz <= ~clk_100Hz;
            end
        end
    end                 
endmodule
