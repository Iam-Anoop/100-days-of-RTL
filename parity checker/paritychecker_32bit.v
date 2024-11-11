`timescale 1ns / 1ps

module paritychecker_32bit( input[31:0]datain,
                            input paritybit,
                            output reg errorflag);
reg paritycheck;
integer i;

always@(*)
begin
    paritycheck=0;
    for(i=0;i<32;i=i+1)
        paritycheck=paritycheck^datain[i];
    errorflag=(paritybit^paritycheck);
end        
                            
                            
endmodule
