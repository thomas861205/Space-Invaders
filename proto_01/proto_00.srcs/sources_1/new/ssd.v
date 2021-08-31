`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/01 00:39:15
// Design Name: 
// Module Name: ssd
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


module ssd(i,ssd);
input [3:0] i;
output reg [7:0] ssd;

always@(i) begin
    case(i)
    4'b0000: ssd[7:0]=8'b0000_0011;
    4'b0001: ssd[7:0]=8'b1001_1111;
    4'b0010: ssd[7:0]=8'b0010_0101;
    4'b0011: ssd[7:0]=8'b0000_1101;
    4'b0100: ssd[7:0]=8'b1001_1001;
    4'b0101: ssd[7:0]=8'b0100_1001;
    4'b0110: ssd[7:0]=8'b0100_0001;
    4'b0111: ssd[7:0]=8'b0001_1011;
    4'b1000: ssd[7:0]=8'b0000_0001;
    4'b1001: ssd[7:0]=8'b0000_1001;
    default: ssd[7:0]=8'b0111_0001;
    endcase
end
endmodule
