`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2024 10:48:55
// Design Name: 
// Module Name: ripplecarry_adder_4bit
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


module ripplecarry_adder_4bit(input [3:0]a,b,
                              input cin,
                              output [3:0]sum,
                              output cout);
                              
//not necessary to declare those 1 bit internal wires ya,yb,yc ,tool will assume it as wire
//wire ya,yb,yc;
//lsb full adder instantiation
fulladder fa0(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(ya));
//2nd and third full adder
fulladder fa1(.a(a[1]),.b(b[1]),.cin(ya),.sum(sum[1]),.cout(yb));
fulladder fa2(.a(a[2]),.b(b[2]),.cin(yb),.sum(sum[2]),.cout(yc));
//msb full adder
fulladder fa3(.a(a[3]),.b(b[3]),.cin(yc),.sum(sum[3]),.cout(cout));                             
endmodule
