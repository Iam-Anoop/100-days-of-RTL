`timescale 1ns / 1ps

module tb();
reg clk,reset;
reg [3:0]datain;
wire[3:0]dataout;
integer i;

pipo dut(.clk(clk),.reset(reset),.datain(datain),.dataout(dataout));

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
    for(i=0;i<5;i=i+1) begin
        @(negedge clk)
        datain={$random}%16;
        end
end
endtask

initial
begin
$monitor("time=%0t|datain=%b|dataout=%b",$time,datain,dataout);
@(negedge clk)
    datain=4'd0;
resetdrive;
inputdrive;
#50;
$finish;
end
         
endmodule
