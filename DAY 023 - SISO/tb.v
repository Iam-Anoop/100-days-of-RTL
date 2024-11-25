`timescale 1ns / 1ps

module tb();
reg clk,reset,datain;
wire dataout;

siso dut(.clk(clk),.reset(reset),.datain(datain),.dataout(dataout));

//clk generation
initial
begin
clk=1'b0;
forever #5 clk=~clk;
end

//task reset
task resetdrive;
begin
    @(negedge clk)
        reset=1'b1;
    @(negedge clk)
        reset=1'b0;
end
endtask

task initialise;
begin
    datain=1'b0;
end
endtask    

//task input
task inputdrive(input i);
begin
    @(negedge clk)
        datain=i;
end
endtask

initial
begin
$monitor("time=%0t|input=%b|output=%b",$time,datain,dataout);
initialise;
resetdrive;
inputdrive(1'b1);
inputdrive(1'b1);
inputdrive(1'b1);
inputdrive(1'b1);
inputdrive(1'b0);
inputdrive(1'b1);
inputdrive(1'b1);
inputdrive(1'b0);
#200;
$finish;
end
                  
endmodule
