`timescale 1ns / 1ps

module barrelshifter( input[7:0]datain,
                      input [2:0]shiftamt,
                      input [2:0]shifttype, //000 logical left shift,001 lrs ,  010 arith right shift,011 rotate right,100 rotate left
                      output reg [7:0]dataout);
                      
always@(*)
begin
    case(shifttype)
    3'b000:dataout=datain<<shiftamt; //logical left shift
    3'b001:dataout=datain>>shiftamt;  // logical right shift
    3'b010:dataout=$signed(datain)>>>shiftamt; //arith right shift
    3'b011:dataout=(datain >> shiftamt) | (datain << (8 - shiftamt));// rotate right
    3'b100:dataout=(datain << shiftamt) | (datain >> (8 - shiftamt)); // rotate left
    default:dataout=datain;  
    endcase
end                     
endmodule
