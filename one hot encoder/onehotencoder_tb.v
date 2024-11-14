`timescale 1ns / 1ps

module onehotencoder_tb();
reg [3:0]datain;
wire[15:0]dataout;
integer i;

onehot_encoder dut(.datain(datain),.dataout(dataout));

task initialise;
begin
datain=4'd0;
end
endtask

task inputdrive;
begin
    for(i=0;i<16;i=i+1) begin
        datain={$random}%16;
        #10;
        end
end
endtask

initial
begin
$monitor("time=%0t|input=%b|output=%b",$time,datain,dataout);
initialise;
#10;
inputdrive;
#50;
$finish;
end
        
endmodule
