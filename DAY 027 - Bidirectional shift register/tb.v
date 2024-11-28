`timescale 1ns / 1ps

module tb();
reg clk,reset,datain,mode;
wire [3:0]dataout;

bidirectionalshiftreg dut(.clk(clk),.reset(reset),.datain(datain),.mode(mode),.dataout(dataout));

initial
begin
clk=1'b0;
forever #5 clk=~clk;
end

task resetdrive;
begin
    @(negedge clk)
    reset=1'b1;
    @(negedge clk)
    reset=1'b0;
end
endtask

task inputdriveleft(input i);
begin
mode=1;
    @(negedge clk)
    datain=i;
end
endtask

task inputdriveright(input j);
begin
mode=0;
    @(negedge clk)
    datain=j;
end
endtask

initial
begin
$monitor("time=%0t|datain=%b|mode=%b|dataout=%b",$time,datain,mode,dataout);
datain=1'b0;
resetdrive;
inputdriveleft(1'b1);
inputdriveleft(1'b1);
inputdriveright(1'b0);
inputdriveleft(1'b1);
inputdriveright(1'b1);
#10;
$finish;
end
    
endmodule
