`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.11.2024 22:47:22
// Design Name: 
// Module Name: binarytobcd 
//////////////////////////////////////////////////////////////////////////////////


module binarytobcd(input[7:0]datain,
                   output reg[11:0]dataout);
                   
reg[3:0]bit1,bit2,bit3;
integer i;

always@(*)
begin
    {bit1,bit2,bit3}=0;
    for(i=0;i<8;i=i+1)
        begin
            if(bit1>=5)
                bit1=bit1+3;
            if(bit2>=5)
                bit2=bit2+3;
            if(bit3>=5)
                bit3=bit3+3;
           {bit1,bit2,bit3}={bit1,bit2,bit3,datain[7-i]};//here left shifting take place such that msb get removed on adding each datain by bit slicing             
        end
   dataout={bit1,bit2,bit3};
end
                                 
endmodule
