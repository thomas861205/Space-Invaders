`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/09 12:44:42
// Design Name: 
// Module Name: enable
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


module enable(
   input clk,
   input rst,
   input en0,
   input en1,
   input en2,
   input keydown,
   output reg whitespace0,
   output reg whitespace1,
   output reg whitespace2
   );

    always @(posedge clk or posedge rst )
        if(rst) begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
            whitespace2 <= 0 ;
        end
        else if((en0==0) && keydown) begin
            whitespace0 <= 1 ;
            whitespace1 <= 0 ;
            whitespace2 <= 0 ;
        end
        else if((en1==0) && keydown) begin
            whitespace0 <= 0 ;
            whitespace1 <= 1 ;
            whitespace2 <= 0 ;
        end
        else if((en2==0) && keydown) begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
            whitespace2 <= 1 ;
        end
        else begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
            whitespace2 <= 0 ;
        end

endmodule
