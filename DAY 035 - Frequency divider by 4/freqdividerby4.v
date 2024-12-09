`timescale 1ns / 1ps
module freqdividerby4(input clk,reset,
                      output clkout);
                      
wire q1;

dff d1(.clk(clk),.reset(reset),.d(~q1),.q(q1)); 
dff d2(.clk(q1),.reset(reset),.d(~clkout),.q(clkout));                    
endmodule

