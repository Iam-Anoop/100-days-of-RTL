`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2024 11:17:40
// Design Name: 
// Module Name: mux8x1
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


module mux8x1(input [7:0]datain,
              input[2:0]s,
              output reg dataout);
              
always@(*)
begin
    case(s)
    3'd0:dataout=datain[0];
    3'd1:dataout=datain[1];
    3'd2:dataout=datain[2];
    3'd3:dataout=datain[3];
    3'd4:dataout=datain[4];
    3'd5:dataout=datain[5];
    3'd6:dataout=datain[6];
    3'd7:dataout=datain[7];
    default:dataout=0;
    endcase
end    
endmodule
