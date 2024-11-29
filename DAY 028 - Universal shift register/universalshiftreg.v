`timescale 1ns / 1ps

module universalshiftreg(input clk,reset,
                         input[7:0]datain,
                         input[1:0]mode,
                         output[7:0]dataout);
                         
reg[7:0]loadtemp;

always@(posedge clk)
begin
    if(reset)
        loadtemp<=8'd0;
    else
        begin
            case(mode)
            2'b00:loadtemp<=loadtemp;  //no change
            2'b01:loadtemp<={loadtemp[6:0],1'b0};  //left shift
            2'b10:loadtemp<={1'b0,loadtemp[7:1]};  //right shift
            2'b11:loadtemp<=datain;  // load input
            default:loadtemp<=loadtemp;
            endcase
        end           
end 

assign dataout=loadtemp;                         
endmodule
