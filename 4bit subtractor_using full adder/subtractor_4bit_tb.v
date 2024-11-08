`timescale 1ns / 1ps

module subtractor_4bit_tb();
reg[3:0]A,B;
wire cout;
wire [3:0]diff;
integer i;

subtract_4bitbinary dut(.A(A),.B(B),.diff(diff),.cout(cout));

task initialise;
begin
A=4'd0;
B=4'd0;
end
endtask

task inputdrive;
begin
    for(i=0;i<10;i=i+1)
        begin
        A={$random}%16;
        B={$random}%16;
        #10;
        end  
end
endtask

//calling tasks
initial
begin
$monitor("time=%0t|A=%d|B=%d|diff=%d|cout=%d",$time,A,B,$signed(diff),cout);
initialise;
#10;
inputdrive;
#50;
$finish;
end
          
        
endmodule
