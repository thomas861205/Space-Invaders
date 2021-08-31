module enable(
   input clk,
   input rst,
   input en0,
   input en1,
   input en2,
   input en3,
   input en4,
   input keydown,
   output reg whitespace0,
   output reg whitespace1,
   output reg whitespace2,
   output reg whitespace3,
   output reg whitespace4
   ); 
    //always @(posedge key_down[41] or posedge rst or negedge en0 or negedge en1 )
    //always @(*)
    //always @(posedge clk2 or posedge rst or posedge key_down[41] )
    /*always @(posedge clk or posedge rst )
        if(rst) begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
        end
        else if((en0==0)&&key_down[41]&&clk2) begin
            whitespace0 <= 1;
            whitespace1 <= 0;
        end
        else if((en1==0)&&key_down[41]&&clk2) begin
            whitespace0 <= 0;
            whitespace1 <= 1;
        end
        else if((en0==0)&&keydown) begin
            whitespace0 <= 1;
            whitespace1 <= 0;
        end
        else if((en1==0)&&keydown) begin
            whitespace0 <= 0;
            whitespace1 <= 1;
        end

        else begin
            whitespace0 <=0;
            whitespace1 <=0;
        end*/
    //the below code can fire two bullets,but it can support continue fire.
    always @(posedge clk or posedge rst )
        if(rst) begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
            whitespace2 <= 0 ;
            whitespace3 <= 0 ;
            whitespace4 <= 0 ;
        end
        else if((en0==0)&&keydown) begin
            whitespace0 <= 1 ;
            whitespace1 <= 0 ;
            whitespace2 <= 0 ;
            whitespace3 <= 0 ;
            whitespace4 <= 0 ;
        end
        else if((en1==0)&&keydown) begin
            whitespace0 <= 0 ;
            whitespace1 <= 1 ;
            whitespace2 <= 0 ;
            whitespace3 <= 0 ;
            whitespace4 <= 0 ;
        end
        else if((en2==0)&&keydown) begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
            whitespace2 <= 1 ;
            whitespace3 <= 0 ;
            whitespace4 <= 0 ;
        end
        else if((en3==0)&&keydown) begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
            whitespace2 <= 0 ;
            whitespace3 <= 1 ;
            whitespace4 <= 0 ;
        end
        else if((en4==0)&&keydown) begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
            whitespace2 <= 0 ;
            whitespace3 <= 0 ;
            whitespace4 <= 1 ;
        end
        else begin
            whitespace0 <= 0 ;
            whitespace1 <= 0 ;
            whitespace2 <= 0 ;
            whitespace3 <= 0 ;
            whitespace4 <= 0 ;
        end
endmodule