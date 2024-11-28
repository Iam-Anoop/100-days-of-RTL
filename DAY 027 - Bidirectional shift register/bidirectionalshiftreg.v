`timescale 1ns / 1ps

module bidirectionalshiftreg(input clk,reset,datain,
                             input mode,  //mode 1 for left shift and 0 for right shift
                             output reg [3:0]dataout);
                             
always@(posedge clk)
begin
    if(reset)
        dataout<=4'd0;
    else if(mode)
        dataout<={dataout[2:0],datain};
    else
        dataout<={datain,dataout[3:1]};
end
                                                 
endmodule
