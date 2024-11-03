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


module mux16to1_toptb();
reg [15:0]datain;
reg[3:0]s;
wire y;
integer i;

 mux16x1_top dut(.datain(datain),.s(s),.y(y));

task initialise;
begin   
    datain=16'd0;
    s=2'd0;
end
endtask

task inputdrive;
begin
     for(i=0;i<16;i=i+1) begin
        datain=16'd15;
        s=i;
        #10;
        end
     for(i=0;i<16;i=i+1) begin
        datain=16'd30;
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
