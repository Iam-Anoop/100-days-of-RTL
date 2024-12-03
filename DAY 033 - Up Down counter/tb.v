`timescale 1ns / 1ps

module tb();
parameter N=16,
          width=4;
reg clk,reset,mode;
wire[width-1:0]count;

updowncounter dut(.clk(clk),.reset(reset),.mode(mode),.count(count));

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

initial
begin
$monitor("time=%0t|mode=%b|count=%d",$time,mode,count);
resetdrive;
mode=0;
#200;
mode=1;
#150;
$finish;
end    
    
endmodule
