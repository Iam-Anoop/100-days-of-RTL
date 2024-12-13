`timescale 1ns / 1ps
module singleportram(input clk,reset,we,oe,
                     input[3:0]addr,
                     inout [7:0]data);
integer i;                     
reg [7:0]mem[0:15];
reg[7:0]tempdata;   //for making the read operation synchronous with clk

always@(posedge clk)
begin
    if(reset) begin
        tempdata<=0;
        for(i=0;i<16;i=i+1) begin
            mem[i]<=0;
            end
        end
    else if(!oe&&we) 
        mem[addr]<=data;
    else if(oe&!we) 
        tempdata<=mem[addr];
end

assign data=(oe&&!we)?tempdata:8'bz;

endmodule
