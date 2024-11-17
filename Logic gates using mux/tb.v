`timescale 1ns / 1ps

module tb();
reg A,B;
wire notout,andout,orout,xorout,xnorout,nandout,norout;

logicgate_usingmux dut(.A(A),.B(B),.notout(notout),.andout(andout),.orout(orout),.xorout(xorout),.xnorout(xnorout),.nandout(nandout),.norout(norout));

 initial begin
 $monitor("time=%0t|INPUT1=%b|INPUT2=%b|NOT=%b|AND=%b|OR=%b|NOR=%b|NAND=%b|xor=%b|xnor=%b",$time,A,B,notout,andout,orout,norout,nandout,xorout,xnorout);
  A = 1'b0; B = 1'b0;
 #10; 
 A = 1'b0; B = 1'b1;
 #10;
 A = 1'b1; B = 1'b0;
 #10; 
 A = 1'b1; B = 1'b1;
 #10;
 $finish;
 end
 


endmodule
