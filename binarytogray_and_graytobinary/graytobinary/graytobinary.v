`timescale 1ns / 1ps

module graytobinary(input[7:0]gray,
                    output reg [7:0]binary);
                    
always@(*)
begin
    binary[7]=gray[7];
    binary[6]=binary[7]^gray[6];
    binary[5]=binary[6]^gray[5];
    binary[4]=binary[5]^gray[4];
    binary[3]=binary[4]^gray[3];
    binary[2]=binary[3]^gray[2];
    binary[1]=binary[2]^gray[1];
    binary[0]=binary[1]^gray[0];
end
                        
endmodule
