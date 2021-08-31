`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/02 11:18:03
// Design Name: 
// Module Name: one_pulse_space
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


module one_pulse_space(
	output reg signal_single_pulse,
	input wire signal,
	input wire clock,
	input rst
	);
	
	reg signal_delay;
	reg [6:0] cnt;
	always @(posedge clock or posedge rst ) begin
		if(rst)
			cnt <=0;
		else if (signal == 1'b1)
			if(cnt == 50)
				cnt <= 0;
			else 
				cnt <= cnt + 1'b1;
		else 
			cnt <= cnt;
	end
	always @(posedge clock) begin
		if (signal == 1'b1 & signal_delay == 1'b0)
		  signal_single_pulse <= 1'b1;
		else if(cnt == 50)
		  signal_single_pulse <= 1'b1;
		else
		  signal_single_pulse <= 1'b0;

		signal_delay <= signal;
	end
endmodule
