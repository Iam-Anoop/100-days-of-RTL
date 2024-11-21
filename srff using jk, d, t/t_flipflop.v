`timescale 1ns / 1ps
module t_flipflop(input t,clk,reset,
                  output reg q);

always@(posedge clk)
begin
    if(reset)
        q<=0;
    else begin
        if(t==1)
            q<=~q;
        else
            q<=q;
        end
end        
                                                    
endmodule                  