`timescale 1ns / 1ps

module tb();
reg [7:0]datain;
reg [2:0]shiftamt;
reg [2:0]shifttype;
wire [7:0]dataout;

barrelshifter dut(.datain(datain),.shiftamt(shiftamt),.shifttype(shifttype),.dataout(dataout));

initial
begin
    $monitor("time=%0t|datain=%b|shiftamt=%d|shifttype=%b|dataout=%b",$time,datain,shiftamt,shifttype,dataout);
    datain=11100101;shiftamt=3;shifttype=000;#10;
    datain=11100101;shiftamt=3;shifttype=001;#10;
    datain=11100101;shiftamt=3;shifttype=010;#10;
    datain=11100101;shiftamt=3;shifttype=011;#10;
    datain=11100101;shiftamt=3;shifttype=100;#10;
    datain=11100101;shiftamt=3;shifttype=101;#10;
    datain=11100101;shiftamt=3;shifttype=111;#10;
    $finish;
end
       
endmodule
