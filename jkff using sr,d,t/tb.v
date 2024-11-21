`timescale 1ns / 1ps

module tb();
reg j,k,clk,reset;
wire q_sr,q_d,q_t;

jkff_using_srdt dut(.j(j),.k(k),.clk(clk),.reset(reset),.q_sr(q_sr),.q_d(q_d),.q_t(q_t));

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
   
task inputdrive(input x,y);
begin
@(negedge clk)
    j=x;
    k=y;
end
endtask

task initialise;
begin
j=0;
k=0;
end
endtask

initial
begin
initialise;
resetdrive;
inputdrive(1'b0,1'b0);
inputdrive(1'b0,1'b1);
inputdrive(1'b1,1'b0);
inputdrive(1'b1,1'b1);
#10;
$finish;
end
   
endmodule
