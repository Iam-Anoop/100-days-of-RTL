`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.11.2024 12:05:10
// Design Name: 
// Module Name: ripplecarryadder_tb
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


module ripplecarryadder_tb();
reg [3:0]a,b;
reg cin;
wire cout;
wire[3:0]sum;

ripplecarry_adder_4bit dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

task initialise;
begin
    cin=0;
    a=4'd0;
    b=4'd0;
end
endtask

task inputdrive(input[3:0]i,j,input k);
begin
    a=i;
    b=j;
    cin=k;
end 
endtask

// calling task
initial
begin
$monitor("time=%0t|a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
initialise;
#10;
inputdrive(4'b1011, 4'b0111, 1'b0);
#10;
inputdrive(4'b1111, 4'b0101, 1'b1);
#10;
inputdrive(4'b1001, 4'b1111, 1'b0);
#50;
$finish;
end
   
endmodule
