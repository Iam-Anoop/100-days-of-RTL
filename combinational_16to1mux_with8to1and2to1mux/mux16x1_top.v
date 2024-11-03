`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 11:18:37
// Design Name: 
// Module Name: mux16x1_top
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


module mux16x1_top(input[15:0]datain,
                   input[3:0]s,
                   output y );
wire ya,yb;                   

mux8x1 muxa(.datain(datain[7:0]),.s(s[2:0]),.dataout(ya)); // here mapped the datain 8bit bus or vector of instantiated module to the sliced datain signal of the tb module , we can also map this with concantenation operator such that datain of the instantiated module mapping to the concantenated signal of tb like .datain({datain[7],datain[6],.....datain[0]})
mux8x1 muxb(.datain(datain[15:8]),.s(s[2:0]),.dataout(yb));
mux2x1 muxc(.datain({yb,ya}),.s0(s[3]),.dataout(y));
                  
endmodule
