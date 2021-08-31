`timescale 1ns / 1ps

module counter_bullet(
	input clk,
	input rst,
	input [9:0] h_my_plane,
	input [9:0] v_my_plane,
	input whitespace,
	output reg [9:0] h_bullet,
	output reg [9:0] v_bullet,
	output reg state
	);

reg state_next;

always@(*) begin
	if (rst) begin
		state <= 0;
	end
	else begin
		state <= state_next;
	end
end

always@(posedge clk or posedge rst) begin
	case(state)
	1'b0: begin
		if (rst) begin
			h_bullet <= h_my_plane;
			v_bullet <= v_my_plane;
			state_next <= 1'b0;
		end
		else if (whitespace) begin
			h_bullet <= h_bullet;
			v_bullet <= v_bullet;
			state_next <= 1'b1;
		end
		 else begin
            h_bullet <= h_my_plane;
            v_bullet <= v_my_plane;
            state_next <= 1'b0;
        end
	end
	1'b1: begin
		if (rst) begin
			h_bullet <= h_my_plane;
			v_bullet <= v_my_plane;
			state_next <= 1'b0;
		end
		else if (v_bullet < 2) begin
			h_bullet <= h_my_plane;
			v_bullet <= v_my_plane;
			state_next <=1'b0;
		end
		else begin
			h_bullet <= h_bullet;
			v_bullet <= v_bullet - 2;
			state_next <= 1'b1;
		end
	end
	endcase
end
endmodule