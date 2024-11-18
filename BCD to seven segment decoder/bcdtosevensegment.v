`timescale 1ns / 1ps

module bcdtosevensegment(input[3:0]bcd,
                         output reg [6:0]segment);//segment[6] to the A of display s[5]to B segment[4] to C
                         
always@(*)
begin
    case(bcd)
    4'd0:segment=7'b1111110;//0
    4'd1:segment=7'b0110000;//digit 1
    4'd2:segment=7'b1101101;
    4'd3:segment=7'b1111001;
    4'd4:segment=7'b0110011;
    4'd5:segment=7'b1011011;
    4'd6:segment=7'b1011111;
    4'd7:segment=7'b1110000;
    4'd8:segment=7'b1111111;
    4'd9:segment=7'b1111011;
    default:segment=7'b0000000;
    endcase
end
                             
endmodule
