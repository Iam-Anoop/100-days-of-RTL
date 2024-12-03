`timescale 1ns / 1ps

module tb();
reg clk,reset;
wire[3:0]count;

ringcounter dut(.clk(clk),.reset(reset),.count(count));

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
$monitor("time=%0t|count=%b",$time,count);
resetdrive;
#100;
$finish;
end


    
endmodule
