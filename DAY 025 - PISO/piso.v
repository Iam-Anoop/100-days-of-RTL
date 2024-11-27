`timescale 1ns / 1ps

module piso( input clk,reset,
             input[3:0]datain,
             input load,
             output reg dataout);
             
reg [3:0]temp;

always@(posedge clk)
begin
    if(reset) begin
        temp<=4'd0;
        dataout=1'd0;
        end
    else if(load) //input is loaded
        temp<=datain;
    else  //shifting is done
        temp<=temp>>1; //right shifting
        dataout<=temp[0];
        
end                     
endmodule
