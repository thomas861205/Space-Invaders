`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/05/26 14:45:01
// Design Name: 
// Module Name: counter
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


module counter(
   input clk,
   input rst,
   input [9:0] h_offset,
   input [9:0] v_offset,
   input [511:0] key_down,
   input [8:0] last_change,
   output reg [9:0] h_my_plane,
   output reg [9:0] v_my_plane 
    );
    wire[4:0] length_plane ;
    assign length_plane = 16;
    // key_down[41] is white space.
    // key_down[372] is right.
    // key_down[107] is left.
    // key_down[117] is up.
    //key_down[114] is down.
  
    always @(posedge clk or posedge rst)
       begin
           if(rst) begin
                h_my_plane <= h_offset;  
                v_my_plane <= v_offset; 
           end       
           else if(key_down[117] && key_down[114] && key_down[107] && key_down[372] )
           begin 
                h_my_plane <= h_my_plane;    
                v_my_plane <= v_my_plane;
           end        
           else if(key_down[117] && key_down[114] && key_down[107] ) 
           begin                                                                      
                if( h_my_plane > 0) h_my_plane <= h_my_plane - 1'b1;  
                else h_my_plane <= h_my_plane;                                          
                v_my_plane <= v_my_plane;                                             
           end  
           else if(key_down[117] && key_down[114] && key_down[372] ) 
           begin                                                                      
                if( h_my_plane < 319-length_plane) h_my_plane <= h_my_plane + 1'b1;                                             
                else h_my_plane <= h_my_plane;
                v_my_plane <= v_my_plane;                                             
           end  
           else if(key_down[117] && key_down[107] && key_down[372] ) 
           begin                                                                      
                h_my_plane <= h_my_plane;   
                if( v_my_plane > 0 ) v_my_plane <= v_my_plane - 1'b1;  
                else v_my_plane <= v_my_plane ;                                             
           end                
           else if(key_down[114] && key_down[107] && key_down[372] ) 
           begin                                                                      
                h_my_plane <= h_my_plane;                                             
                if( v_my_plane < 239-length_plane ) v_my_plane <= v_my_plane + 1'b1; 
                else v_my_plane <= v_my_plane ;                                   
           end       
           else if(key_down[117] && key_down[107] ) 
           begin                                    
                if( h_my_plane > 0) h_my_plane <= h_my_plane - 1'b1;                                             
                else h_my_plane <= h_my_plane;           
                if( v_my_plane > 0 ) v_my_plane <= v_my_plane - 1'b1;  
                else v_my_plane <= v_my_plane ;           
           end                                 
           else if(key_down[117] && key_down[372] ) 
           begin                                    
                if( h_my_plane < 319-length_plane) h_my_plane <= h_my_plane + 1'b1;                                             
                else h_my_plane <= h_my_plane;           
                if( v_my_plane > 0 ) v_my_plane <= v_my_plane - 1'b1;  
                else v_my_plane <= v_my_plane ;                                   
           end                   
           else if(key_down[114] && key_down[107] ) 
           begin                                    
                if( h_my_plane > 0) h_my_plane <= h_my_plane - 1'b1;                                             
                else h_my_plane <= h_my_plane;           
                if( v_my_plane < 239-length_plane ) v_my_plane <= v_my_plane + 1'b1; 
                else v_my_plane <= v_my_plane ;           
           end                      
           else if(key_down[114] && key_down[372] ) 
           begin                                    
                if( h_my_plane < 319-length_plane) h_my_plane <= h_my_plane + 1'b1;                                             
                else h_my_plane <= h_my_plane;           
                if( v_my_plane < 239-length_plane ) v_my_plane <= v_my_plane + 1'b1; 
                else v_my_plane <= v_my_plane ;           
           end          
           else if(key_down[117]) 
           begin                                    
                h_my_plane <= h_my_plane;           
                if( v_my_plane > 0 ) v_my_plane <= v_my_plane - 1'b1;  
                else v_my_plane <= v_my_plane ;            
           end                    
           else if(key_down[114]) 
           begin                                    
                h_my_plane <= h_my_plane;           
                if( v_my_plane < 239-length_plane ) v_my_plane <= v_my_plane + 1'b1; 
                else v_my_plane <= v_my_plane ;           
           end                       
           else if(key_down[107]) 
           begin                                    
                if( h_my_plane > 0) h_my_plane <= h_my_plane - 1'b1;                                             
                else h_my_plane <= h_my_plane;           
                v_my_plane <= v_my_plane;           
           end                            
           else if(key_down[372]) 
           begin                                    
                if( h_my_plane < 319-length_plane) h_my_plane <= h_my_plane + 1'b1;                                             
                else h_my_plane <= h_my_plane;            
                v_my_plane <= v_my_plane;           
           end                   
           else begin
                h_my_plane <= h_my_plane;     
                v_my_plane <= v_my_plane;
           end                                    
       end
 endmodule
