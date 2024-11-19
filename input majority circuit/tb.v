`timescale 1ns / 1ps

module tb();
reg[6:0]datain;
wire y;
integer i;

inputmajoritycircuit dut(.datain(datain),.y(y));

task inputdrive;
begin
    datain=7'd0;
    #10;
    for(i=0;i<5;i=i+1) begin
        datain={$random}%128;
        #10;
        end
end
endtask

initial
begin
$monitor("time=%0t|input=%b|output=%b",$time,datain,y);
inputdrive;
$finish;
end
endmodule
