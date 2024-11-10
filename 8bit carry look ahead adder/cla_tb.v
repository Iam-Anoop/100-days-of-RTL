`timescale 1ns / 1ps



module cla_tb();
reg [7:0]a,b;
reg cin;
wire[7:0]sum;
wire cout;

carrylookahead_adder_8bit dut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

task initialise;
begin
a=8'd0;
b=8'd0;
cin=0;
end
endtask

task inputdrive(input[7:0]ain,bin,input c);
begin
   a=ain;
   b=bin;
   cin=c;
end
endtask

//calling tasks
initial
begin
    $monitor("time=%0t|a=%d|b=%d|cin=%b|sum=%d|cout=%b",$time,a,b,cin,sum,cout);
    initialise;
    #10;   
    inputdrive(8'b10101111,8'b00110101,1'b1);//overflow occur
    #10;
    inputdrive(8'b11101011,8'b10110101,1'b0);//overflow occurs
    #10;
    inputdrive(8'b10111000,8'b00000100,1'b1);
    #10;
    inputdrive(8'b10101001,8'b10100100,1'b0);
    #50;
    $finish;
end
    
    

endmodule
