`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/09 15:20:08
// Design Name: 
// Module Name: hit_time_counter
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


module hit_time_counter(
    input hit,
    input clk,
    input rst,
    output reg [4:0] hit_times
    );
reg [4:0] num;
reg [4:0] next_num;

always@(posedge clk or posedge rst)begin
    if (rst) begin
        hit_times <= 0;
        num <= 0;
    end
    else if (next_num > num) begin
        hit_times <= hit_times + 1;
        num <= next_num;
    end
    else begin
        hit_times <= hit_times;
        num <= next_num;
    end
end

always@(posedge hit or posedge rst)begin
    if (rst)
        next_num <= 0;
    else
        next_num <= next_num + 1;
end

endmodule
