`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 15:20:42
// Design Name: 
// Module Name: clk_200Hz
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

module clk_200Hz(clk,rst,clk_200Hz);
    input clk;
    input rst;
    output reg clk_200Hz ;
    reg [26:0] cnt;
    always @( posedge clk or posedge rst)begin
        if(rst) begin
            cnt <= 27'b0;
            clk_200Hz <= 1'b0;
        end
        else begin
            cnt <= cnt + 1'b1;
            if(cnt == 27'd250_000) begin
                cnt <= 0;
                clk_200Hz <= ~clk_200Hz;
            end
        end
    end                 
endmodule
