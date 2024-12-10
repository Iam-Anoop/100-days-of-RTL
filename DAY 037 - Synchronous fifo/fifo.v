`timescale 1ns / 1ps
module fifo #(parameter width=8,
                        depth=16)
             (input clk,resetn,
              input [width-1:0]datain,
              input re,we,
              output reg[width-1:0]dataout,
              output empty,full);
              
reg [width-1:0]mem[depth-1:0];
reg [$clog2(depth):0]rdptr,wrptr;    //rd and wr ptr is of n bits if the depth is 2^n
reg [$clog2(depth)+1:0]count;       
always@(posedge clk)
begin
    if(!resetn) begin
        rdptr<=0;
        wrptr<=0;
        dataout<=0;
        count<=0;
        end
    else begin
        if(we&!full) begin
            mem[wrptr]<=datain;
            wrptr<=wrptr+1;
            count<=count+1;
            end
        if(re&!empty) begin
            dataout<=mem[rdptr];
            rdptr<=rdptr+1;
            count<=count-1;
   
            end        
    end
end

assign full=(count==depth);
assign empty=(count==0);
    
              
endmodule
