`timescale 1ns / 1ps

module tb();
reg s,r,clk,reset;
wire q_d,q_jk,q_t;

srff_using_jkdt dut(.s(s),.r(r),.clk(clk),.reset(reset),.q_d(q_d),.q_t(q_t),.q_jk(q_jk));

//clock generation
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
    
task initialise;
begin
@(negedge clk)
{s,r}=2'b00;
end
endtask

task inputdrive(input i,j);
begin
@(negedge clk)
s=i;
r=j;    
end
endtask

initial
begin
$monitor("time=%0t|S=%b|R=%b|output from dff=%b|output from tff=%b|output from jkff=%b",$time,s,r,q_d,q_t,q_jk);
initialise;
resetdrive;
inputdrive(0,0);
inputdrive(0,1);
inputdrive(1,0);
inputdrive(1,1);
inputdrive(0,1);

#50;
$finish;
end
        
endmodule
