`timescale 1ns / 1ps


module binarytobcd_tb();
reg [7:0]datain;
wire [11:0]dataout;


binarytobcd dut(.datain(datain),.dataout(dataout));

initial 
begin
$monitor("time=%0t|datain=%b,dataout=%b",$time,datain,dataout);
datain=8'b00000000;
#10;
datain=8'b11111111;
#100;
$finish;
end
endmodule 
