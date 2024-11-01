`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 16:09:16
// Design Name: 
// Module Name: 4x1mux
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


module mux4_1( input [3:0]datain,
               input [1:0]s,
               output reg dataout );
               
always@(*)
begin
    case(s)
    2'd0:dataout=datain[0];
    2'd1:dataout=datain[1]; 
    2'd2:dataout=datain[2]; 
    2'd3:dataout=datain[3];
    default:dataout=0;
    endcase
end                    
endmodule
