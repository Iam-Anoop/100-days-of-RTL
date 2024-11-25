`timescale 1ns / 1ps

module siso( input datain,clk,reset,
             output reg dataout);
             
reg [3:0]temp; //designing a 4 bit siso

always@(posedge clk)
begin
    if(reset) begin
        temp<=4'd0;
        dataout<=1'b0;
        end
        
    else 
        temp<={datain,temp[3:1]}; //here data is being given into the register through leftmost ff ie msb ff and output is taken from the rightmost ff 
        dataout<=temp[0];
end        
                        
endmodule
