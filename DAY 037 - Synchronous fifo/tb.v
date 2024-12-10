`timescale 1ns / 1ps
module tb();
parameter width=8,depth=16;
reg clk,resetn,re,we;
reg[width-1:0]datain;
wire[width-1:0]dataout;
wire empty,full;
integer i;

fifo dut(.clk(clk),.resetn(resetn),.datain(datain),.re(re),.we(we),.dataout(dataout),.empty(empty),.full(full));

initial
begin
    clk=1'b0;
    forever #5 clk=~clk;
end

task resetdrive;
begin
    @(negedge clk)
    resetn=1'b0;
    @(negedge clk)
    resetn=1'b1;
end
endtask

task inputdrive;
begin
    for(i=0;i<16;i=i+1) begin
    @(negedge clk)
    we=1;re=0;
    datain={$random}%256;
    end
    for(i=0;i<16;i=i+1) begin
    @(negedge clk)
    we=0;re=1;
    datain={$random}%256;
    end
end
endtask

initial
begin
$monitor("time=%0t|re=%b|we=%b|datain=%d|dataout=%d,emptyflag=%b|fullflag=%b",$time,re,we,datain,dataout,empty,full);
resetdrive;
inputdrive;
#50;
$finish;  
end

endmodule
