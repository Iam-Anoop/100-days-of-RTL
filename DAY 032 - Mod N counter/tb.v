`timescale 1ns / 1ps

module tb();
parameter N=8,
          length=3;
reg clk,reset;
wire [length-1:0]dataout;

modncounter dut(.clk(clk),.reset(reset),.dataout(dataout));

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
$monitor("time=%0t|count=%d",$time,dataout);
resetdrive;
#100;
$finish;
end
    
endmodule
