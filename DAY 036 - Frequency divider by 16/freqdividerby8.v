`timescale 1ns / 1ps

module freqdividerby16(input clk,reset,
                      output clkout);
                      
wire [1:0]count1,count2;

mod4counter counter1(.clk(clk),.reset(reset),.count(count1));
mod4counter counter2(.clk(count1[1]),.reset(reset),.count(count2)); //here the output of first counter divided by 4 given as clk to the next then it is again divided by 4
assign clkout=count2[1];
                      
endmodule
