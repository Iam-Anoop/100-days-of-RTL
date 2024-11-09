`timescale 1ns / 1ps



module tb();
reg [2:0]in;
wire [7:0]m;
wire sum,carry;
integer i;

fulladder_usingdecoder dut(.in(in),.m(m),.sum(sum),.carry(carry));

task initialise;
begin
in=3'd0;
end
endtask 


task inputdrive;
begin
    for(i=0;i<8;i=i+1) begin
        in=$random%8;
        #10;
        end
end
endtask

initial
begin
initialise;
#10
inputdrive;
#50;
$finish;

end        

endmodule
