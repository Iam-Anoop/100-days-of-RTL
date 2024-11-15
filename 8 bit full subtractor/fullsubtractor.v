`timescale 1ns / 1ps

module fullsubtractor(input a,b,bin,
                      output  d,
                      output  bout);
                                          
assign d=(a^b^bin);
assign bout=(~a&b)|(~a&bin)|(b&bin);
                      
endmodule
