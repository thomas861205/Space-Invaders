`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/15 23:43:42
// Design Name: 
// Module Name: the_grand_rgb_mux
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

module the_grand_rgb_mux(
	input [2:0] state,
	input [8:0] default_color,
	input [8:0] rgb_menu,
	input [8:0] rgb_gameover,
//	input [8:0] rgb_clear,
	input [8:0] pixel_out,
	input [8:0] rgb_bg,
	output reg [8:0] the_grand_rgb
	);

always@(*) begin
	case(state)
	3'b000:
		the_grand_rgb = (rgb_menu!=default_color)? rgb_menu:rgb_bg;
	3'b011:
	   	the_grand_rgb = (rgb_gameover!=default_color)? rgb_gameover:rgb_bg;
	3'b100:
	   the_grand_rgb = (rgb_menu!=default_color)? rgb_menu:rgb_bg;
	default:
		the_grand_rgb = pixel_out;
	endcase
end
endmodule
