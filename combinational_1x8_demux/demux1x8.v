`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 20:07:17
// Design Name: 
// Module Name: demux1x8
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


module demux1x8(input datain,
                input [2:0]s,
                output  reg[7:0]dataout);

always@(*)
begin
    case(s)
    3'd0:dataout[0]=datain;
    3'd1:dataout[1]=datain;
    3'd2:dataout[2]=datain;
    3'd3:dataout[3]=datain;
    3'd4:dataout[4]=datain;
    3'd5:dataout[5]=datain;
    3'd6:dataout[6]=datain;
    3'd7:dataout[7]=datain;
    default:dataout[7:0]=0;
    endcase
end                    
endmodule
