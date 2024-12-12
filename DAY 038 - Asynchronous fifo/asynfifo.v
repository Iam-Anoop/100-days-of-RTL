`timescale 1ns / 1ps
module asynfifo #(parameter depth=16,
                            width=8)
(input wrclk,rdclk,re,we,reset,
 input [width-1:0]datain,
 output reg [width-1:0]dataout,
 output reg empty,full);
 
 localparam addrwidth=$clog2(depth);
 
 //internal reg
 reg [width-1:0]mem[0:depth-1];
 reg [addrwidth:0]rdptr,wrptr;  //1 bit extra here to write full logic 
 reg[addrwidth:0]wrptrsyn1,wrptrsyn2;
 reg[addrwidth:0]rdptrsyn1,rdptrsyn2;
 
//write logic
always@(posedge wrclk )
begin
    if(reset)
        wrptr<=0;
    else if(we&&!full) begin
        mem[wrptr[addrwidth-1:0]]<=datain;
        wrptr<=wrptr+1;
        end
end

//read logic
always@(posedge rdclk )
begin
    if(reset) begin
        rdptr<=0;
        dataout<=0;
        end
    else if(re&&!empty) begin
        dataout<=mem[rdptr[addrwidth-1:0]];
        rdptr<=rdptr+1;
        end
end

//syn wrptr to rdclk domain
always@(posedge rdclk)
begin
    if(reset) begin
        wrptrsyn1<=0;
        wrptrsyn2<=0;
        end
    else begin
        wrptrsyn1<=wrptr;
        wrptrsyn2<=wrptrsyn1;
        end
end

//syn rdptr to wrclk domain
always@(posedge wrclk)
begin
    if(reset) begin
        rdptrsyn1<=0;
        rdptrsyn2<=0;
        end
    else begin
        rdptrsyn1<=rdptr;
        rdptrsyn2<=rdptrsyn1;
        end
end 

//full and empty logic
always@(posedge wrclk)
begin
    if(reset)
        full<=0;
    else
        full<=((wrptr[addrwidth-1:0]==rdptrsyn2[addrwidth-1:0])&& (wrptr[addrwidth]!=rdptrsyn2[addrwidth]));
end

always@(posedge rdclk)
begin
    if(reset)
        empty<=1;
    else
        empty<=(rdptr==wrptrsyn2);
end
  
endmodule
