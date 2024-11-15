`timescale 1ns / 1ps

module fullsubtractor_tb();
reg [7:0]a,b;
reg bin;
wire[7:0]d;
wire bout;

fullsubtractor_8bit dut(.a(a),.b(b),.bin(bin),.d(d),.bout(bout));

task initialise;
begin
a=8'd0;
b=8'd0;
bin=0;
end
endtask

task inputdrive;
begin
    repeat(5) begin
        a={$random}%256;
        b={$random}%256; // when a is less than b result will be negative but this is unsigned full subtractor so the result will be wrap arounded
        bin=1;
        #10;
        end
     repeat(5) begin
        a={$random}%256;
        b={$random}%256;
        bin=0;
        #10;
        end 
end        
endtask

initial
begin
$monitor("time=%0t|input1=%d|input2=%d|bin=%b|d=%d|bout=%b",$time,a,b,bin,d,bout);
initialise;
#10;
inputdrive;
$finish;
end         

endmodule
