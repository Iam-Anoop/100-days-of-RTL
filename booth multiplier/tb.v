`timescale 1ns / 1ps

module tb();
reg signed [7:0]m,q;
wire signed [15:0]result;

boothmultiplier dut(.m(m),.q(q),.result(result));

initial
begin
m=0;q=0;#10;
m=18;q=-8;#10;
m=-44;q=10;#10;
m=-44;q=-10;#10;
m=44;q=-10;#10;
end

initial
 begin
 $monitor("time=%0t|m=%d|q=%d|result=%d",$time,m,q,result);
 #50;
 $finish;
 
 end
 

endmodule
