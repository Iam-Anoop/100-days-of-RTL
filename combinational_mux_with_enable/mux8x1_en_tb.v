`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2024 17:57:02
// Design Name: 
// Module Name: mux8x1_en_tb
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


module mux8x1_en_tb();
reg [7:0]datain;
reg[2:0]s;
reg en;
wire dataout;
integer i;

mux8x1_with_en dut(.s(s),.datain(datain),.dataout(dataout),.en(en));

task initialise;
begin
    en=1;
    datain=4'd0;
end
endtask

task inputdrive;
begin
    en=0;
    datain=4'd12;//1100
    for(i=0;i<8;i=i+1)
     begin
       s=i;
       #10;
     end
end
endtask

//calling task
initial
    begin
        initialise;
        #10;
        inputdrive;
        #100;
        $finish;
    end               
    
endmodule
