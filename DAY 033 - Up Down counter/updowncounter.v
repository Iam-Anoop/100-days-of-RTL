`timescale 1ns / 1ps
//4 bit updown counter
module updowncounter #(parameter N=16,
                                 width=4)
                     (input clk,reset,mode,
                     output reg[width-1:0]count);
always@(posedge clk)
begin
    if(reset)
        count<=4'd0;
    else if(mode==0) begin  //down count
        if(count==4'd0)   
            count<=N-1;
        else 
            count<=count-1;
        end
    else if(mode==1) begin  //up count
        if(count==N-1)   
            count<=4'd0;
        else 
            count<=count+1;
        end  
end
                                                     
endmodule
