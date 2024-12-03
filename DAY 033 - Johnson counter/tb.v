`timescale 1ns / 1ps

module tb();
parameter N=4;
reg clk,reset;
wire [N-1:0]count;

johnsoncounter dut(.clk(clk),.reset(reset),.count(count));

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
