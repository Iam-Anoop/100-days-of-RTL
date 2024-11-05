`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 05.11.2024 19:24:06
// Design Name: 
// Module Name: decoder

//////////////////////////////////////////////////////////////////////////////////


module decoder(input[2:0]datain,
               input en,
               output reg[7:0]dataout);
               
always@(*)
begin
    dataout=8'd0;
    if(en) begin
        case(datain)
        3'd0:dataout[0]=1'b1;
        3'd1:dataout[1]=1'b1;
        3'd2:dataout[2]=1'b1;
        3'd3:dataout[3]=1'b1;
        3'd4:dataout[4]=1'b1;
        3'd5:dataout[5]=1'b1;
        3'd6:dataout[6]=1'b1;
        3'd7:dataout[7]=1'b1;
        default:dataout=8'd0;
        endcase
        end
    else
        dataout=8'd0;
end            
              
endmodule
