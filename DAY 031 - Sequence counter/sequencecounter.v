`timescale 1ns / 1ps
//sequence counter for count 0,2,5,7,11,14 and repeats
module sequencecounter(input clk,reset,
                       output[3:0]dataout);
                       
reg[3:0]state;

always@(posedge clk)
begin
    if(reset)
        state<=4'd0;
    else
        case(state)
        4'd0:state<=4'd2;
        4'd2:state<=4'd5;
        4'd5:state<=4'd7;
        4'd7:state<=4'd11;
        4'd11:state<=4'd14;
        4'd14:state<=4'd0; //to repeat the sequence
        default:state<=4'd0;
        endcase
end
assign dataout=state;        
                                   
endmodule
