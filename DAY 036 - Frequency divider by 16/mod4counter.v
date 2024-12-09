`timescale 1ns / 1ps
//count from 0 to 3 ie 2 bits req for output
module mod4counter(input clk,reset,
                   output reg [1:0]count);
                   
always@(posedge clk or posedge reset)
begin
    if(reset)
    count<=2'd0;
    else begin
        if(count==2'd3)
        count<=2'd0;
        else
        count<=count+1;
        end
end
                           
endmodule
