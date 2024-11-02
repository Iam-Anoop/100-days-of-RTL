`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 20:21:43
// Design Name: 
// Module Name: mux4x1_topmodule
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


module mux4x1_topmodule(input[3:0]datain,
                        input[1:0]s,
                        output y);
wire ya,yb; //intermediate wires inside the top module

//muxa and mux b instantiation to select betweeen 4 datain using so sel line
mux2x1 muxa(.datain({datain[1],datain[0]}),.s0(s[0]),.dataout(ya)); //here data in mux2to1 is declared in single port in the sub module so i use concantenate operator
mux2x1 muxb(.datain({datain[3],datain[2]}),.s0(s[0]),.dataout(yb));

//mux c to select between output of muxa and muxb with s1
mux2x1 muxc(.datain({yb,ya}),.s0(s[1]),.dataout(y));
                       
endmodule
