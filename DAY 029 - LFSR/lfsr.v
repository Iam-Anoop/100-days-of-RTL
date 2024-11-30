`timescale 1ns / 1ps

module lfsr(input clk,reset,
            output reg[3:0]dataout);
            
wire feedback;

//for 4 bit lfsr feedback polynomial = x^4+x^1+1
assign feedback= dataout[3]^dataout[0];

always@(posedge clk)
begin
    if(reset)
        dataout<=0001 ;//provide lfsr with a seed(initial output of lfsr) which is to be non zero
    else
        dataout<={dataout[2:0],feedback};//here left shift operaation is done using adding the feedback to lsb ff ie to the 0th ff 
end
             
endmodule
