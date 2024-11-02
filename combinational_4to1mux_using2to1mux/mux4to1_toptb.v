`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 21:51:04
// Design Name: 
// Module Name: mux4to1_toptb
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


module mux4to1_toptb();
reg [3:0]datain;
reg[1:0]s;
wire y;
integer i;

mux4x1_topmodule dut(.datain(datain),.s(s),.y(y));

task initialise;
begin   
    datain=4'd0;
    s=2'd0;
end
endtask

task inputdrive;
begin
     for(i=0;i<4;i=i+1) begin
        datain=4'b0011;
        s=i;
        #10;
        end
     for(i=0;i<4;i=i+1) begin
        datain=4'b1101;
        s=i;
        #10;
        end
end
endtask

//calling tasks
initial
begin
initialise;
#10;
inputdrive;
#50;
$finish;
end         
endmodule
