`timescale 1ns / 1ps

module graycodecounter(input clk,reset,
                       output reg[3:0]count);
                       
reg [3:0]bincount;

always@(posedge clk)
begin
    if(reset) begin
    count<=4'd0;
    bincount<=4'd0;
    end
    else begin
        if(bincount==4'b1111) begin
           count<=4'd0;
           bincount<=4'd0;
           end
        else begin
            bincount<=bincount+1;
            count<={bincount[3],bincount[3]^bincount[2],bincount[2]^bincount[1],bincount[1]^bincount[0]};
            end
        end
end
                                            
endmodule
