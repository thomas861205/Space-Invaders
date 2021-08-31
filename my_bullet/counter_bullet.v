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
    // key_down[41] is white space.
    // key_down[372] is right.
    // key_down[107] is left.
    // key_down[117] is up.
    //key_down[114] is down.
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
              h_bullet <= h_my_plane;
              v_bullet <= v_my_plane;
              state_next <= 1'b0;
           end
           else if (whitespace) begin
              state_next <= 1'b1;
              h_bullet <= h_bullet;
              v_bullet <= v_bullet;
           end
           else begin
              state_next <= 1'b0;
              h_bullet <= h_my_plane;
              v_bullet <= v_my_plane;
           end
        end 
        1'b1 : begin
           if(rst) begin
              h_bullet <= h_my_plane;
              v_bullet <= v_my_plane;
              state_next <= 1'b0;
           end
           else if(v_bullet == 1)begin
              state_next <= 1'b0;
              h_bullet <= h_my_plane;
              v_bullet <= v_my_plane;
           end
           else begin
              state_next <= 1'b1;
              h_bullet <= h_bullet;
              v_bullet <= v_bullet - 1'b1;
           end
        end
        endcase
        end
 endmodule 
