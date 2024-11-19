`timescale 1ns / 1ps

module inputmajoritycircuit( input[6:0]datain,
                             output reg y);
                             
reg [3:0]sum;   

always@(*)
begin    
    sum=datain[0]+datain[1]+datain[2]+datain[3]+datain[4]+datain[5]+datain[6];
    
    if(sum>=4)
        y=1'b1;
    else
        y=1'b0;
end                             
endmodule
