`timescale 1ns / 1ps

module tb();
reg clk,reset;
reg[1:0]mode;
reg [7:0]datain;
wire[7:0]dataout;

universalshiftreg dut(.clk(clk),.reset(reset),.datain(datain),.mode(mode),.dataout(dataout));

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

task inputdrive;
begin
    @(negedge clk)
        mode=2'b00;
        datain=8'd12;
    @(negedge clk)
        mode=2'b01;
    @(negedge clk)
        mode=2'b10;
        datain=8'd14;
    @(negedge clk)
        mode=2'b11;
    @(negedge clk)
        mode=2'b10; 
    @(negedge clk)
        mode=2'b00;     
end
endtask

initial
begin
$monitor("time=%0t|datain=%b|mode=%b|dataout=%b",$time,datain,mode,dataout);
datain=8'd0;
resetdrive;
inputdrive;
#10;
$finish;
end

endmodule
