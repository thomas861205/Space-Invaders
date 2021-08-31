`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/16 00:42:17
// Design Name: 
// Module Name: the_grand_shift_pattern
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


module the_grand_shift_pattern(
	input [2:0] state,
	input [9:0] h_offset_enemy0,
	input [9:0] v_offset_enemy0,
	input [9:0] h_offset_enemy1,
	input [9:0] v_offset_enemy1,
	input [9:0] h_offset_enemy2,
	input [9:0] v_offset_enemy2,
	input [9:0] h_offset_enemy3,
	input [9:0] v_offset_enemy3,
	input [9:0] h_offset_enemy4,
	input [9:0] v_offset_enemy4,
	input [9:0] h_offset_enemy5,
	input [9:0] v_offset_enemy5,
	input [9:0] h_offset_enemy6,//
	input [9:0] v_offset_enemy6,//
	input [9:0] h_offset_enemy7,//
	input [9:0] v_offset_enemy7,//
	input [9:0] h_offset_enemy8,//
	input [9:0] v_offset_enemy8,//
	input [9:0] h_offset_enemy9,//
	input [9:0] v_offset_enemy9,//
	input [9:0] h_offset_enemy0_1,
    input [9:0] v_offset_enemy0_1,
    input [9:0] h_offset_enemy1_1,
    input [9:0] v_offset_enemy1_1,
    input [9:0] h_offset_enemy2_1,
    input [9:0] v_offset_enemy2_1,
    input [9:0] h_offset_enemy3_1,
    input [9:0] v_offset_enemy3_1,
    input [9:0] h_offset_enemy4_1,
    input [9:0] v_offset_enemy4_1,
    input [9:0] h_offset_enemy5_1,
    input [9:0] v_offset_enemy5_1,
    input [9:0] h_offset_enemy6_1,//
    input [9:0] v_offset_enemy6_1,//
    input [9:0] h_offset_enemy7_1,//
    input [9:0] v_offset_enemy7_1,//
    input [9:0] h_offset_enemy8_1,//
    input [9:0] v_offset_enemy8_1,//
    input [9:0] h_offset_enemy9_1,//
    input [9:0] v_offset_enemy9_1,//
	output reg [9:0] the_grand_h_offset_enemy0,
	output reg [9:0] the_grand_v_offset_enemy0,
	output reg [9:0] the_grand_h_offset_enemy1,
	output reg [9:0] the_grand_v_offset_enemy1,
	output reg [9:0] the_grand_h_offset_enemy2,
	output reg [9:0] the_grand_v_offset_enemy2,
	output reg [9:0] the_grand_h_offset_enemy3,
	output reg [9:0] the_grand_v_offset_enemy3,
	output reg [9:0] the_grand_h_offset_enemy4,
	output reg [9:0] the_grand_v_offset_enemy4,
	output reg [9:0] the_grand_h_offset_enemy5,
	output reg [9:0] the_grand_v_offset_enemy5,
	output reg [9:0] the_grand_h_offset_enemy6,//
	output reg [9:0] the_grand_v_offset_enemy6,//
	output reg [9:0] the_grand_h_offset_enemy7,//
	output reg [9:0] the_grand_v_offset_enemy7,//
	output reg [9:0] the_grand_h_offset_enemy8,//
	output reg [9:0] the_grand_v_offset_enemy8,//
	output reg [9:0] the_grand_h_offset_enemy9,//
	output reg [9:0] the_grand_v_offset_enemy9//
	);

always@(*) begin
	case(state)
	3'b000: begin
		the_grand_h_offset_enemy0 = 0;
		the_grand_v_offset_enemy0 = 223;
		the_grand_h_offset_enemy1 = 0;
		the_grand_v_offset_enemy1 = 223;
		the_grand_h_offset_enemy2 = 0;
		the_grand_v_offset_enemy2 = 223;
		the_grand_h_offset_enemy3 = 0;
		the_grand_v_offset_enemy3 = 223;
		the_grand_h_offset_enemy4 = 0;
		the_grand_v_offset_enemy4 = 223;
		the_grand_h_offset_enemy5 = 0;
		the_grand_v_offset_enemy5 = 223;
		the_grand_h_offset_enemy6 = 0;//
		the_grand_v_offset_enemy6 = 223;//
		the_grand_h_offset_enemy7 = 0;//
		the_grand_v_offset_enemy7 = 223;//
		the_grand_h_offset_enemy8 = 0;//
		the_grand_v_offset_enemy8 = 223;//
		the_grand_h_offset_enemy9 = 0;//
		the_grand_v_offset_enemy9 = 223;//
	end
	3'b001: begin
		the_grand_h_offset_enemy0 = h_offset_enemy0;
		the_grand_v_offset_enemy0 = v_offset_enemy0;
		the_grand_h_offset_enemy1 = h_offset_enemy1;
		the_grand_v_offset_enemy1 = v_offset_enemy1;
		the_grand_h_offset_enemy2 = h_offset_enemy2;
		the_grand_v_offset_enemy2 = v_offset_enemy2;
		the_grand_h_offset_enemy3 = h_offset_enemy3;
		the_grand_v_offset_enemy3 = v_offset_enemy3;
		the_grand_h_offset_enemy4 = h_offset_enemy4;
		the_grand_v_offset_enemy4 = v_offset_enemy4;
		the_grand_h_offset_enemy5 = h_offset_enemy5;
		the_grand_v_offset_enemy5 = v_offset_enemy5;
		the_grand_h_offset_enemy6 = h_offset_enemy6;//
		the_grand_v_offset_enemy6 = v_offset_enemy6;//
		the_grand_h_offset_enemy7 = h_offset_enemy7;//
		the_grand_v_offset_enemy7 = v_offset_enemy7;//
		the_grand_h_offset_enemy8 = h_offset_enemy8;//
		the_grand_v_offset_enemy8 = v_offset_enemy8;//
		the_grand_h_offset_enemy9 = h_offset_enemy9;//
		the_grand_v_offset_enemy9 = v_offset_enemy9;//
	end
	3'b010: begin
        the_grand_h_offset_enemy0 = h_offset_enemy0_1;
        the_grand_v_offset_enemy0 = v_offset_enemy0_1;
        the_grand_h_offset_enemy1 = h_offset_enemy1_1;
        the_grand_v_offset_enemy1 = v_offset_enemy1_1;
        the_grand_h_offset_enemy2 = h_offset_enemy2_1;
        the_grand_v_offset_enemy2 = v_offset_enemy2_1;
        the_grand_h_offset_enemy3 = h_offset_enemy3_1;
        the_grand_v_offset_enemy3 = v_offset_enemy3_1;
        the_grand_h_offset_enemy4 = h_offset_enemy4_1;
        the_grand_v_offset_enemy4 = v_offset_enemy4_1;
        the_grand_h_offset_enemy5 = h_offset_enemy5_1;
        the_grand_v_offset_enemy5 = v_offset_enemy5_1;
        the_grand_h_offset_enemy6 = h_offset_enemy6_1;//
        the_grand_v_offset_enemy6 = v_offset_enemy6_1;//
        the_grand_h_offset_enemy7 = h_offset_enemy7_1;//
        the_grand_v_offset_enemy7 = v_offset_enemy7_1;//
        the_grand_h_offset_enemy8 = h_offset_enemy8_1;//
        the_grand_v_offset_enemy8 = v_offset_enemy8_1;//
        the_grand_h_offset_enemy9 = h_offset_enemy9_1;//
        the_grand_v_offset_enemy9 = v_offset_enemy9_1;//
    end
	default: begin
		the_grand_h_offset_enemy0 = 0;
		the_grand_v_offset_enemy0 = 223;
		the_grand_h_offset_enemy1 = 0;
		the_grand_v_offset_enemy1 = 223;
		the_grand_h_offset_enemy2 = 0;
		the_grand_v_offset_enemy2 = 223;
		the_grand_h_offset_enemy3 = 0;
		the_grand_v_offset_enemy3 = 223;
		the_grand_h_offset_enemy4 = 0;
		the_grand_v_offset_enemy4 = 223;
		the_grand_h_offset_enemy5 = 0;
		the_grand_v_offset_enemy5 = 223;
		the_grand_h_offset_enemy6 = 0;//
		the_grand_v_offset_enemy6 = 223;//
		the_grand_h_offset_enemy7 = 0;//
		the_grand_v_offset_enemy7 = 223;//
		the_grand_h_offset_enemy8 = 0;//
		the_grand_v_offset_enemy8 = 223;//
		the_grand_h_offset_enemy9 = 0;//
		the_grand_v_offset_enemy9 = 223;//
	end
	endcase
end
endmodule
