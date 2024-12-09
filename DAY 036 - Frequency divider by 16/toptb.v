`timescale 1ns / 1ps

module toptb();
reg clk,reset;
wire clkout;

freqdividerby16 dut(.clk(clk),.reset(reset),.clkout(clkout));

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
#300;
$finish;
end



endmodule
