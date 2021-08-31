`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 12:32:52
// Design Name: 
// Module Name: test_counter
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


module test_counter();
wire [1:0] ssd_ctl;
wire [9:0] hit_times;
wire [3:0] i;
freq_div U0(
    .clk(clk),
    .rst(rst),
    .ssd_ctl(ssd_ctl)
    );
hit_counter U1(
    .rst(rst),
    .hit_plane(hit_enemy0),
    .hit_times(hit_times)
    );
ssd_ctl U2(
    .ssd_ctl(ssd_ctl),
    .d_0(hit_times%10),
    .d_1(hit_times/10%10),
    .d_2(hit_times/100%10),
    .d_3(hit_times/1000),
    .four(four),
    .i(i));
ssd U3(
    .i(i),
    .ssd(ssd)
    );
endmodule
