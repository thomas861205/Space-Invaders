`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/09 09:03:33
// Design Name: 
// Module Name: counter_enemy_bullet
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


module counter_enemy_bullet(
   input clk,
   input speed,
   input rst,
   input direction,
   input [9:0] x_displacement,
   input [9:0] y_displacement,
   input [9:0] h_enemy,
   input [9:0] v_enemy,
   output reg [9:0] h_bullet,
   output reg [9:0] v_bullet
   );
   reg state;
    reg state_next;
    //
    always @(*)
        if(rst) begin
            state <= 0 ;
        end
        else  begin
            state <= state_next;
        end
            
    always @(posedge clk or posedge rst )begin
        case(state)
        1'b0 : begin
           if(rst) begin
              h_bullet <= h_enemy;
              v_bullet <= v_enemy;
              state_next <= 1'b0;
           end
           else if (speed) begin
              state_next <= 1'b1;
              h_bullet <= h_bullet;
              v_bullet <= v_bullet;
           end
           else begin
              state_next <= 1'b0;
              h_bullet <= h_enemy;
              v_bullet <= v_enemy;
           end
        end 
        1'b1 : begin
           if(rst) begin
              h_bullet <= h_enemy;
              v_bullet <= v_enemy;
              state_next <= 1'b0;
           end
           else if(v_bullet >= (479-32-y_displacement) )begin
              state_next <= 1'b0;
              h_bullet <= h_enemy;
              v_bullet <= v_enemy;
           end
           else if(h_bullet <= x_displacement)begin
              state_next <= 1'b0;
              h_bullet <= h_enemy;
              v_bullet <= v_enemy;
           end
           else if(h_bullet >= (639-32-x_displacement) )begin
              state_next <= 1'b0;
              h_bullet <= h_enemy;
              v_bullet <= v_enemy;
           end
           else if(direction == 1)begin
              state_next <= 1'b1;
              h_bullet <= h_bullet + x_displacement;
              v_bullet <= v_bullet + y_displacement;
           end
           else if(direction == 0)begin
              state_next <= 1'b1;
              h_bullet <= h_bullet - x_displacement;
              v_bullet <= v_bullet + y_displacement;
           end
        end
        endcase
        end
 endmodule
