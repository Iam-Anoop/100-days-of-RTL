`timescale 1ns / 1ps

module graytobinary_tb();
reg [7:0]gray;
wire[7:0]binary;
integer i;

graytobinary dut(.binary(binary),.gray(gray));

task initialise;
begin
gray=8'd0;
end
endtask

task inputdrive;
begin
for(i=0;i<8;i=i+1) begin
    gray={$random}%256;
    #10;
    end
end
endtask

//calling tasks
initial
begin
$monitor("time=%0t|input=%b|output=%b",$time,gray,binary);
initialise;
#10;
inputdrive;
#50;
$finish;
end    
    

endmodule
