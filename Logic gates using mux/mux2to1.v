`timescale 1ns / 1ps

module mux2to1(input S,
              input[1:0]I,
              output Y);
              
assign Y=(S)?I[1]:I[0];
endmodule
