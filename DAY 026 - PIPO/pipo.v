`timescale 1ns / 1ps

module pipo(input clk,reset,load,
            input[3:0]datain,
            output reg [3:0]dataout);
            
always@(posedge clk)
begin
    if(reset)
        dataout<=4'd0;
    else
        dataout<=datain; //pipo is a storage / buffer register such that for each  posedge of clock cycle whatever in the datain is stored and given out of the register like buffer 
end
        
    

          
endmodule
