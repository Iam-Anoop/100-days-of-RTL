`timescale 1ns / 1ps

module ringcounter( input clk,reset,
                    output reg [3:0]count);
                    
always@(posedge clk)
begin
    if(reset)
        count<=4'b0001;
    else
        count<={count[0],count[3:1]}; //right shifting and wrap around
end                           
endmodule
