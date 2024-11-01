`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2024 16:19:55
// Design Name: 
// Module Name: mux4_1_tb
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


module mux4_1_tb();
reg [3:0]datain; reg [1:0]s;
wire dataout;
integer i;

mux4_1 dut(.datain(datain),.s(s),.dataout(dataout));


task inputdrive;
begin
datain=4'b1011;
for(i=0;i<4;i=i+1) begin
    s=i;
    #10;
    end   
end
endtask
//s=0;
//#10;
//s=1;
//#10;
//s=2;
//#10;
//s=3;
// task inputdrive(input[3:0]din,input[1:0]sel)
//begin
//#10;
//datain=din; s=sel;
// then on calling tasks we give value to the task arguments such that we call task as inputdrive(4'b1010,2'b01)

//calling tasks
initial
begin
    inputdrive;
    #100;
    $finish;
end    
    

endmodule

