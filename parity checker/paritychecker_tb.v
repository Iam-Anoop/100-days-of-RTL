`timescale 1ns / 1ps



module paritychecker_tb();
reg [31:0]datain;
reg paritybit;
wire errorflag;

paritychecker_32bit dut(.datain(datain),.paritybit(paritybit),.errorflag(errorflag));

initial
begin
$monitor("time=%0t|datain=%b|paritybit=%b|errorflag=%b",$time,datain,paritybit,errorflag);
    datain=32'd0;
    paritybit=1;
    #10;
    datain=32'd128;
    paritybit=1;
    #10;
    datain=32'd254;
    paritybit=1;
    #10;
    datain=32'd439;
    paritybit=0;
    #10;
    datain=32'd369;
    paritybit=1;
    #10;
    datain=32'd711;
    paritybit=0;
    #50;
    $finish;
end    
endmodule
