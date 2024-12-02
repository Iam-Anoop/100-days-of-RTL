`timescale 1ns / 1ps

module modncounter #(parameter N=8, //counter give output from 0 to 7
                               length=3)
                    (input clk,reset,
                     output reg[length-1:0]dataout);
                     
                     
always@(posedge clk)
begin
    if(reset)
        dataout<=3'd0;
    else begin
        if(dataout==N-1)
            dataout<=3'd0;
        else 
            dataout<=dataout+1;
       end
end
                                                    
endmodule
