`timescale 1ns / 1ps

module nbitcomparator_tb();
reg[7:0]a,b;
wire a_greater,a_lesser,equal;
integer i;

nbitcomparator dut(.a(a),.b(b),.a_greater(a_greater),.a_lesser(a_lesser),.equal(equal));

task initialise;
begin
a=8'd0;
b=8'd0;
#10;
end
endtask

task inputdrive;
begin
    for(i=0;i<10;i=i+1) begin
        a={$random}%256;
        b={$random}%256;
        #10;
        end
end
endtask

initial
begin
$monitor("time=%0t|a=%d|b=%d|a_greater=%b|a_lesser=%b|equal=%b",$time,a,b,a_greater,a_lesser,equal);

initialise;
inputdrive;
#50;
$finish; 
end
       
endmodule
