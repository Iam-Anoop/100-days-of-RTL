`timescale 1ns / 1ps

module tb();
reg t,clk,reset;
wire q_jk,q_sr,q_d;

tff_using_jksrd dut(.t(t),.clk(clk),.reset(reset),.q_jk(q_jk),.q_sr(q_sr),.q_d(q_d));

//clk generate
initial 
begin
    clk=1'b0;
    forever #5 clk=~clk;
end    

task initialise;
begin
t=1'b0;
reset=1'b0;
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

task inputdrive(input i);
begin
    @(negedge clk)
    t=i;
end
endtask

initial
begin
initialise;
resetdrive;
inputdrive(1'b0);
inputdrive(1'b1);
#10;
$finish;
end
            
endmodule
