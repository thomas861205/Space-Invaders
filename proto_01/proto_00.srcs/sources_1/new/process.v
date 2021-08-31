`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/15 22:31:08
// Design Name: 
// Module Name: process
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

module process(
input clk,
input select0,
input select1,
input is_died,
input clear,
input rst,
output reg [2:0]state
);
reg [2:0] next_state;
//  000 menu
// 001 level 1
// 010 level 2
// 011 game over
// 100 clear
always @( posedge clk or posedge rst) begin
    if(rst)
        state <= 3'b000;
    else 
        state <= next_state;
end

always @(*) begin
	case(state)
	3'b000 : begin
		if (rst) begin
		// reset
			next_state <= 3'b000;
		end
		else if (select0) begin
			next_state <= 3'b001;
		end
		else if (select1) begin
			next_state <= 3'b010;
		end
		else begin
			next_state <= 3'b000;
		end
	end
	3'b001 : begin
		if (rst) begin
		// reset
			next_state <= 3'b000;
		end
		else if(is_died)begin
			next_state <= 3'b011;
		end
		else if(clear)begin
			next_state <= 3'b100;
		end
		else begin
			next_state <= 3'b001;
		end
	end
	3'b010 : begin
		if (rst) begin
		// reset
			next_state <= 3'b000;
		end
		else if(is_died)begin
			next_state <= 3'b011;
		end
		else if(clear)begin
			next_state <= 3'b100;
		end
		else begin
			next_state <= 3'b010;
		end
	end
	3'b011 : begin
		if (rst) begin
		// reset
			next_state <= 3'b000;
		end
		else begin
			next_state <= 3'b011;
		end
	end
	3'b100 : begin
		if (rst) begin
		// reset
			next_state <= 3'b000;
		end
		else begin
			next_state <= 3'b100;
		end
	end
	endcase 
	end
endmodule
