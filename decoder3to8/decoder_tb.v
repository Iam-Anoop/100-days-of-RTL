`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.11.2024 19:24:32
// Design Name: 
// Module Name: decoder_tb

//////////////////////////////////////////////////////////////////////////////////


module decoder_tb();
reg [2:0]datain;
reg en;
wire [7:0]dataout;
integer data;

decoder dut(.datain(datain),.dataout(dataout),.en(en));

task initialise;
begin
en=0;
datain=3'd0;
end
endtask

task inputdrive;
begin
    en=1;
    #10;
    for(data=0;data<8;data=data+1) begin //
        datain=data[2:0];
        #10;
        end
        en=0;
end
endtask

//calling tasks 
initial
begin
$monitor("time=%0t|datain=%b|dataout=%b",$time,datain,dataout);
initialise;
#10;
inputdrive;
#100;
$finish;
end
    
endmodule

