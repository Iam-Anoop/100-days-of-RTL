`timescale 1ns / 1ps


module lifo( input[7:0]datain,
             input clk,resetn,
             input re,we,
             output reg [7:0]dataout,
             output  full,empty);
             
reg[4:0]ptr; //i extrabit to check full
reg[7:0]mem[15:0];
integer i;


always@(posedge clk)
begin
    if(!resetn) begin
        for(i=0;i<16;i=i+1) begin
            mem[i]<=0;
            ptr<=0;
            dataout<=0;
            end
     end
    else begin
        if(we&!full) begin
            mem[ptr[3:0]]<=datain;
            ptr<=ptr+1;
            end
        if(re&!empty) begin
            dataout<=mem[ptr-1];
            ptr<=ptr-1; 
            
            end
    end    
end 

assign full =(ptr==5'b10000);
assign empty=(ptr==0);      
                                    
endmodule
