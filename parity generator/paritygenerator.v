`timescale 1ns / 1ps

module paritygenerator( input [31:0]datain,
                        output reg parity_bit);
integer i;                        
                        
always@(*)
begin
    parity_bit=0;
    for(i=0;i<32;i=i+1)
        parity_bit=parity_bit^datain[i];
end                             
endmodule
