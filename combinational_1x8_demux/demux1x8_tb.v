`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 20:08:17
// Design Name: 
// Module Name: demux1x8_tb
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


module demux1x8_tb();
reg datain;
reg [2:0]s;
wire [7:0]dataout;
integer i;

demux1x8 dut(.s(s),.datain(datain),.dataout(dataout));

task inputdrive;
begin
    datain=1'b1;
    for(i=0;i<8;i=i+1) begin
        s=i;
        #10;
        end
end
endtask

//calling tasks
initial
begin
inputdrive;
#100;
$finish; 
end       
               
endmodule
