`timescale 1ns / 1ps

module sr_flipflop( input s,r,clk,reset,
                    output reg q);
                    
always@(posedge clk)
begin
    if(reset)
        q<=0;
    else begin
        case({s,r})
            2'b00:q<=q;
            2'b01:q<=0;
            2'b10:q<=1;
            default:q<=2'bxx;
            endcase
       end
end                          
endmodule
