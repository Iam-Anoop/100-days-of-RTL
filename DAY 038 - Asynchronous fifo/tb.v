`timescale 1ns / 1ps
module tb();
parameter depth=16,width=8;
reg wrclk,rdclk,reset,we,re;
reg [width-1:0]datain;
wire [width-1:0]dataout;
wire full,empty;

asynfifo dut(.wrclk(wrclk),.rdclk(rdclk),.we(we),.re(re),.datain(datain),.dataout(dataout),.reset(reset),.empty(empty),.full(full));

initial
begin
    wrclk=1'b0;
    forever #5 wrclk=~wrclk;
end

initial
begin
    rdclk=1'b0;
    forever #7 rdclk=~rdclk;
end

task initialise;
begin
reset=1;
we=0;
re=0;
datain=0;
#10;
reset=0;
end
endtask

task write;
begin
    repeat(depth) begin
        @(negedge wrclk)
        we=1;
        datain={$random}%256;
        end
        #10;
        we=0;
end        
endtask

task read;
begin
    repeat(depth) begin
        @(negedge rdclk)
        re=1;
        end
        #10;
        re=0;
end
endtask
        
initial
begin
    initialise;
    write;
    read;
    #50;
    $finish;
end    
        
        
            
        
    
    
endmodule
