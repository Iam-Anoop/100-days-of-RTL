`timescale 1ns / 1ps
module tb();
reg clk,reset,we,oe;
reg [3:0]addr;
wire [7:0]data;
reg[7:0]tbdata;
integer i;

singleportram dut(.clk(clk),.reset(reset),.we(we),.oe(oe),.addr(addr),.data(data));

assign data = (we && !oe) ? tbdata : 8'bz;

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
resetdrive;
#10
for(i=0;i<16;i=i+1) begin
    @(negedge clk)
    we=1;oe=0;
    addr=i;
    tbdata={$random}%256;   
    end
    @(negedge clk)
    we=0;
for(i=0;i<16;i=i+1) begin
    @(negedge clk)
    oe=1;
    addr=i;
    tbdata={$random}%256;
    end   
#50;
$finish;     
    
end
                
    

endmodule
