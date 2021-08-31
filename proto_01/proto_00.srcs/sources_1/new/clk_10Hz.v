`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/26 12:33:49
// Design Name: 
// Module Name: clk_10Mz
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


module clk_10Hz(clk,rst,clk_10Hz);
    input clk;
    input rst;
    output reg clk_10Hz ;
    reg [26:0] cnt;
    always @( posedge clk or posedge rst)begin
        if(rst) begin
            cnt <= 27'b0;
            clk_10Hz <= 1'b0;
        end
        else begin
            cnt <= cnt + 1'b1;
            if(cnt == 27'd500_0000) begin
                cnt <= 0;
                clk_10Hz <= ~clk_10Hz;
            end
        end
    end                 
endmodule

