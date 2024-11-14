`timescale 1ns / 1ps

module onehot_encoder( input[3:0]datain,
                       output reg [15:0]dataout);
                       
always@(*)
begin
    dataout=16'd0;
    case(datain)
    4'd0:dataout[0]=1'b1;
    4'd1:dataout[1]=1'b1;
    4'd2:dataout[2]=1'b1;
    4'd3:dataout[3]=1'b1;
    4'd4:dataout[4]=1'b1;
    4'd5:dataout[5]=1'b1;
    4'd6:dataout[6]=1'b1;
    4'd7:dataout[7]=1'b1;
    4'd8:dataout[8]=1'b1;
    4'd9:dataout[9]=1'b1;
    4'd10:dataout[10]=1'b1;
    4'd11:dataout[11]=1'b1;
    4'd12:dataout[12]=1'b1;
    4'd13:dataout[13]=1'b1;
    4'd14:dataout[14]=1'b1;
    4'd15:dataout[15]=1'b1; 
    default:dataout=16'd0;
    endcase
end                       
endmodule
