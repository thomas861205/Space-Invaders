`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/15 20:23:46
// Design Name: 
// Module Name: scroll_down_bg
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


module scroll_down_bg(
	input clk,
	input rst,
	output reg [9:0] v_offset
	);

always @(posedge clk or posedge rst) begin
	if (rst) begin
		v_offset <= 239;
	end
	else if (v_offset > 0)  begin
		v_offset <= v_offset - 1;
	end
	else begin
		v_offset <= 239;
	end
end
endmodule