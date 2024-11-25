`timescale 1ns / 1ps

module sipo(input clk,reset,datain,
            output reg[3:0]dataout);
            
always@(posedge clk)
begin
    if(reset)
        dataout<=4'd0;
    else 
        dataout<={dataout[2:0],datain}; //left shifting
end
                  
endmodule
