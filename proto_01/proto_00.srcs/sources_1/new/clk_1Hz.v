`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/09 16:04:30
// Design Name: 
// Module Name: clk_1Hz
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


module clk_1Hz(clk,rst,clk_1Hz);
    input clk;
    input rst;
    output reg clk_1Hz ;
    reg [26:0] cnt;
    always @( posedge clk or posedge rst)begin
        if(rst) begin
            cnt <= 27'b0;
            clk_1Hz <= 1'b0;
        end
        else begin
            cnt <= cnt + 1'b1;
            if(cnt == 27'd5000_0000) begin
                cnt <= 0;
                clk_1Hz <= ~clk_1Hz;
            end
        end
    end                 
endmodule
