`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 09:28:13
// Design Name: 
// Module Name: write_mem_addr_gen
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


module write_mem_addr_gen(
	input clk,
	input rst,
	input en,
	output reg [12:0] pixel_addr
	);

always @(posedge clk or posedge rst) begin
	if (rst) begin
		pixel_addr <= 0;
	end
	else if (pixel_addr < 255) begin
		pixel_addr <= pixel_addr + 1;
	end
	else begin
		pixel_addr<= 0;
	end
end
endmodule
