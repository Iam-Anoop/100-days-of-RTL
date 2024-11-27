`timescale 1ns / 1ps

module tb();
reg clk,reset,load;
reg [3:0]datain;
wire dataout;

piso dut(.clk(clk),.reset(reset),.datain(datain),.load(load),.dataout(dataout));

initial
begin
    clk=1'b0;
    forever #5 clk=~clk;
end

task initialise;
begin
@(negedge clk)
    datain=4'd0;
    load=1;
end
endtask

task resetdrive;
begin
    @(negedge clk)
    reset=1'b1;
     @(negedge clk)
    reset=1'b0;
end
endtask

task inputdriveload(input [3:0]i);
begin
    @(negedge clk)
    load=1;
    datain=i ;
end
endtask

task inputdriveshift(input [3:0]j);
begin
    @(negedge clk)
    load=0;
    datain=j;
end
endtask

initial
begin
$monitor("time=%0t|datain=%b|dataout=%b|load=%b",$time,datain,dataout,load);
initialise;
resetdrive;
inputdriveload(4'd10);
inputdriveshift(4'd5);
inputdriveshift(4'd5);
inputdriveshift(4'd5);
inputdriveload(4'd3);
inputdriveshift(4'd10);
#50;
$finish;
end


       
    
        
endmodule
