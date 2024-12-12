`timescale 1ns / 1ps
module lifo_tb();
reg clk,resetn;
reg[7:0]datain;
reg re,we;
wire [7:0]dataout;
wire full,empty;
integer i;

lifo dut(.clk(clk),.resetn(resetn),.we(we),.re(re),.datain(datain),.dataout(dataout),.full(full),.empty(empty));

initial
begin
clk=1'b0;
forever #5 clk=~clk;
end

task reset;
begin
    @(negedge clk)
        resetn=0;
    @(negedge clk)
        resetn=1;
end
endtask

task write;
reg [7:0]data;
begin
    we=1'b1;
    re=1'b0;
    for(i=0;i<16;i=i+1) begin
        @(negedge clk)
        data={$random}%256;
        datain=data;
        end
end
endtask

task read;
begin
we=1'b0;
re=1'b1;
end
endtask

initial 
begin
reset;
#10;
write;
#20;
read;
#200;
$finish;
end        
                    

endmodule
