`timescale 1ns / 1ps



module nbitcomparator#(parameter N=8)
(input [N-1:0]a,b,
 output a_greater,a_lesser,equal);
 
 assign a_greater=(a>b)?1'b1:1'b0;
 assign a_lesser=(a<b)?1'b1:1'b0;
 assign equal=(a==b)?1'b1:1'b0;
endmodule
