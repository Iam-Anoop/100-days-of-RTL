`timescale 1ns / 1ps

module johnsoncounter #(parameter N=4)
                     ( input clk,reset,
                       output reg [N-1:0]count);
                       
always@(posedge clk)
begin
    if(reset)
        count<=0;
    else
        count<={count[N-2:0],~count[N-1]}; //left shifting with wrap around the complement of the last output to first ff
end
                                   
endmodule
