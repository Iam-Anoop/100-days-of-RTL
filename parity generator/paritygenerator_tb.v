`timescale 1ns / 1ps

module paritygenerator_tb();
reg [31:0]datain;
wire parity_bit;

paritygenerator dut(.datain(datain),.parity_bit(parity_bit));

initial
begin
$monitor("time=%0t|datain=%b|paritybit=%b",$time,datain,parity_bit);
    datain=32'd0;
    #10;
    datain=32'd128;
    #10;
    datain=32'd254;
    #10;
    datain=32'd439;
    #10;
    datain=32'd369;
    #10;
    datain=32'd711;
    #50;
    $finish;
end    
    


endmodule
