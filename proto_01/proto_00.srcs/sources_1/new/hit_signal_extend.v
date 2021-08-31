`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/01 02:22:31
// Design Name: 
// Module Name: hit_signal_extend
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


module hit_signal_extend(
    input clk,
    input rst,
    input hit_plane,
    output reg hit_signal_extend
    );
    
reg first_time;

always@(posedge clk or  posedge rst) begin
    if (rst) begin
        hit_signal_extend<=0;
        first_time<=1;
    end
    else if (first_time) begin
        hit_signal_extend<=hit_signal_extend + 1;
    end
end
endmodule
