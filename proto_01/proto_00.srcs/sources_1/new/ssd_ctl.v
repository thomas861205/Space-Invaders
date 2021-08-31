`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/01 00:39:15
// Design Name: 
// Module Name: ssd_ctl
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


module ssd_ctl(
    input [1:0] ssd_ctl,
    input [3:0] d_0,
    input [3:0] d_1,
    input [3:0] d_2,
    input [3:0] d_3,
    output reg [3:0] four,
    output reg [3:0] i);

always@(ssd_ctl) begin
    case(ssd_ctl)
    2'b00:begin
        four=4'b1110;
        i=d_0;
        end
    2'b01:begin
        four=4'b1101;
        i=d_1;
        end
    2'b10:begin
        four=4'b1011;
        i=d_2;
        end
    2'b11:begin
        four=4'b0111;
        i=d_3;
        end
    default:begin
        four=4'b0000;
        i=4'd8;
    end
    endcase
end
endmodule
